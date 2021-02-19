from string import Template
import sys
import os
import re
import csv
import glob
import time
import threading
from datetime import timedelta
import argparse
import subprocess
import logging
from configparser import ConfigParser, ExtendedInterpolation

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Configure logging system
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
FILE_LOG_FORMAT = '%(levelname)s (%(threadName)10s) - %(message)s'
logging.basicConfig(level=logging.INFO, stream=sys.stdout,
                    format='%(levelname)s (%(threadName)10s) - %(message)s')
logger = logging.getLogger('Modelsim_run_log')

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Parse commandline arguments
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
parser = argparse.ArgumentParser()
parser.add_argument('files', nargs='+',
                    help="Pass SimulationDeckInfo generated by OpenFPGA flow" +
                    " or pass taskname <taskname> <run_number[optional]>")
parser.add_argument('--maxthreads', type=int, default=2,
                    help="Number of fpga_flow threads to run default = 2," +
                    "Typically <= Number of processors on the system")
parser.add_argument('--debug', action="store_true",
                    help="Run script in debug mode")
parser.add_argument('--modelsim_proc_tmpl', type=str,
                    help="Modelsim proc template file")
parser.add_argument('--modelsim_runsim_tmpl', type=str,
                    help="Modelsim runsim template file")
parser.add_argument('--run_sim', action="store_true",
                    help="Execute generated script in formality")
parser.add_argument('--modelsim_proj_name',
                    help="Provide modelsim project name")
parser.add_argument('--modelsim_ini', type=str,
                    default="/uusoc/facility/cad_tools/Mentor/modelsim10.7b/modeltech/modelsim.ini",
                    help="Skip any confirmation")
parser.add_argument('--skip_prompt', action='store_true',
                    help='Skip any confirmation')
parser.add_argument('--ini_filename', type=str,
                    default="simulation_deck_info.ini",
                    help='default INI filename in in fun dir')
args = parser.parse_args()

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Read script configuration file
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
task_script_dir = os.path.dirname(os.path.abspath(__file__))
script_env_vars = ({"PATH": {
    "OPENFPGA_FLOW_PATH": task_script_dir,
    "ARCH_PATH": os.path.join("${PATH:OPENFPGA_PATH}", "arch"),
    "BENCH_PATH": os.path.join("${PATH:OPENFPGA_PATH}", "benchmarks"),
    "TECH_PATH": os.path.join("${PATH:OPENFPGA_PATH}", "tech"),
    "SPICENETLIST_PATH": os.path.join("${PATH:OPENFPGA_PATH}", "SpiceNetlists"),
    "VERILOG_PATH": os.path.join("${PATH:OPENFPGA_PATH}", "VerilogNetlists"),
    "OPENFPGA_PATH": os.path.abspath(os.path.join(task_script_dir, os.pardir,
                                                  os.pardir))}})
config = ConfigParser(interpolation=ExtendedInterpolation())
config.read_dict(script_env_vars)
config.read_file(open(os.path.join(task_script_dir, 'run_fpga_task.conf')))
gc = config["GENERAL CONFIGURATION"]

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Load default templates for modelsim
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
task_script_dir = os.path.dirname(os.path.abspath(__file__))
if not args.modelsim_proc_tmpl:
    args.modelsim_proc_tmpl = os.path.join(task_script_dir, os.pardir,
                                           "misc", "modelsim_proc.tcl")
if not args.modelsim_runsim_tmpl:
    args.modelsim_runsim_tmpl = os.path.join(task_script_dir, os.pardir,
                                             "misc", "modelsim_runsim.tcl")

args.modelsim_proc_tmpl = os.path.abspath(args.modelsim_proc_tmpl)
args.modelsim_runsim_tmpl = os.path.abspath(args.modelsim_runsim_tmpl)


def main():
    if os.path.isfile(args.files[0]):
        create_tcl_script(args.files)
    else:
        # Check if task directory exists and consistent
        taskname = args.files[0]
        task_run = "latest"
        if len(args.files) > 1:
            task_run = f"run{int(args.files[1]):03}"


        # Check if task directory exists and consistent
        local_tasks = os.path.join(*(taskname))
        repo_tasks = os.path.join(gc["task_dir"], *(taskname))
        if os.path.isdir(local_tasks):
            os.chdir(local_tasks)
            curr_task_dir = os.path.abspath(os.getcwd())
        elif os.path.isdir(repo_tasks):
            curr_task_dir = repo_tasks
        else:
            clean_up_and_exit("Task directory [%s] not found" % curr_task_dir)

        os.chdir(curr_task_dir)

        # = = = = = = = Create a current script log file handler = = = =
        logfile_path = os.path.join(cur_task_dir, 
                                    taskname, task_run, "modelsim_run.log")
        resultfile_path = os.path.join(cur_task_dir,
                                       taskname, task_run, "modelsim_result.csv")
        logfilefh = logging.FileHandler(logfile_path, "w")
        logfilefh.setFormatter(logging.Formatter(FILE_LOG_FORMAT))
        logger.addHandler(logfilefh)
        logger.info("Created log file at %s" % logfile_path)
        # = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

        # = = = = Read Task log file and extract run directory = = =
        logfile = os.path.join(cur_task_dir, taskname, task_run, "*_out.log")
        logfiles = glob.glob(logfile)
        if not len(logfiles):
            clean_up_and_exit("No successful run found in [%s]" % temp_dir)

        task_ini_files = []
        for eachfile in logfiles:
            with open(eachfile) as fp:
                run_dir = [re.findall(r'^INFO.*Run directory : (.*)$', line)
                           for line in open(eachfile)]
                run_dir = filter(bool, run_dir)
                for each_run in run_dir:
                    INIfile = os.path.join(each_run[0], args.ini_filename)
                    if os.path.isfile(INIfile):
                        task_ini_files.append(INIfile)
        logger.info(f"Found {len(task_ini_files)} INI files")
        results = create_tcl_script(task_ini_files)
        if args.run_sim:
            collect_result(resultfile_path, results)


def clean_up_and_exit(msg):
    logger.error(msg)
    logger.error("Exiting . . . . . .")
    exit(1)


def create_tcl_script(files):
    runsim_files = []
    for eachFile in files:
        eachFile = os.path.abspath(eachFile)
        pDir = os.path.dirname(eachFile)
        os.chdir(pDir)

        config = ConfigParser()
        config.read(eachFile)
        config = config["SIMULATION_DECK"]

        # Resolve project Modelsim project path
        args.modelsim_run_dir = os.path.dirname(os.path.abspath(eachFile))
        modelsim_proj_dir = os.path.join(
            args.modelsim_run_dir, "MMSIM2")
        logger.info(f"Modelsim project dir not provide " +
                    f"using default {modelsim_proj_dir} directory")

        modelsim_proj_dir = os.path.abspath(modelsim_proj_dir)
        config["MODELSIM_PROJ_DIR"] = modelsim_proj_dir
        if not os.path.exists(modelsim_proj_dir):
            os.makedirs(modelsim_proj_dir)

        # Resolve Modelsim Project name
        args.modelsim_proj_name = config["BENCHMARK"] + "_MMSIM"
        logger.info(f"Modelsim project name not provide " +
                    f"using default {args.modelsim_proj_name} directory")

        config["MODELSIM_PROJ_NAME"] = args.modelsim_proj_name
        config["MODELSIM_INI"] = args.modelsim_ini
        config["VERILOG_PATH"] = os.path.join(
            os.getcwd(), config["VERILOG_PATH"])
        IncludeFile = os.path.join(
            os.getcwd(),
            config["VERILOG_PATH"],
            config["VERILOG_FILE2"])
        IncludeFileResolved = os.path.join(
            os.getcwd(),
            config["VERILOG_PATH"],
            config["VERILOG_FILE2"].replace(".v", "_resolved.v"))
        with open(IncludeFileResolved, "w") as fpw:
            with open(IncludeFile, "r") as fp:
                for eachline in fp.readlines():
                    eachline = eachline.replace("\"./", "\"../../../")
                    fpw.write(eachline)
        # Modify the variables in config file here
        config["TOP_TB"] = os.path.splitext(config["TOP_TB"])[0]

        # Write final template file
        # Write runsim file
        tmpl = Template(open(args.modelsim_runsim_tmpl,
                             encoding='utf-8').read())
        runsim_filename = os.path.join(modelsim_proj_dir,
                                       "%s_runsim.tcl" % config['BENCHMARK'])
        logger.info(f"Creating tcl script at : {runsim_filename}")
        with open(runsim_filename, 'w', encoding='utf-8') as tclout:
            tclout.write(tmpl.substitute(config))

        # Write proc file
        proc_filename = os.path.join(modelsim_proj_dir,
                                     "%s_autocheck_proc.tcl" % config['BENCHMARK'])
        logger.info(f"Creating tcl script at : {proc_filename}")
        with open(proc_filename, 'w', encoding='utf-8') as tclout:
            tclout.write(open(args.modelsim_proc_tmpl,
                              encoding='utf-8').read())
        runsim_files.append({
            "ini_file": eachFile,
            "modelsim_run_dir": args.modelsim_run_dir,
            "runsim_filename": runsim_filename,
            "run_complete": False,
            "status": False,
            "finished": True,
            "starttime": 0,
            "endtime": 0,
            "Errors": 0,
            "Warnings": 0
        })
    # Execute modelsim
    if args.run_sim:
        thread_sema = threading.Semaphore(args.maxthreads)
        logger.info("Launching %d parallel threads" % args.maxthreads)
        thread_list = []
        for thread_no, eachjob in enumerate(runsim_files):
            t = threading.Thread(target=run_modelsim_thread,
                                 name=f"Thread_{thread_no:d}",
                                 args=(thread_sema, eachjob, runsim_files))
            t.start()
            thread_list.append(t)
        for eachthread in thread_list:
            eachthread.join()
        return runsim_files
    else:
        logger.info("Created runsim and proc files")
        logger.info(f"runsim_filename {runsim_filename}")
        logger.info(f"proc_filename {proc_filename}")
        from pprint import pprint
        pprint(runsim_files)


def run_modelsim_thread(s, eachJob, job_list):
    os.chdir(eachJob["modelsim_run_dir"])
    with s:
        thread_name = threading.currentThread().getName()
        eachJob["starttime"] = time.time()
        eachJob["Errors"] = 0
        eachJob["Warnings"] = 0
        try:
            logfile = "%s_modelsim.log" % thread_name
            eachJob["logfile"] = "<task_dir>" + \
                os.path.relpath(logfile, gc["task_dir"])
            with open(logfile, 'w+') as output:
                output.write("* "*20 + '\n')
                output.write("RunDirectory : %s\n" % os.getcwd())
                command = ["vsim", "-c", "-do", eachJob["runsim_filename"]]
                output.write(" ".join(command) + '\n')
                output.write("* "*20 + '\n')
                logger.info("Running modelsim with [%s]" % " ".join(command))
                process = subprocess.Popen(command,
                                           stdout=subprocess.PIPE,
                                           stderr=subprocess.STDOUT,
                                           universal_newlines=True)
                for line in process.stdout:
                    if "Errors" in line:
                        logger.info(line.strip())
                        e, w = re.match(
                            "# .*: ([0-9].*), .*: ([0-9].*)", line).groups()
                        eachJob["Errors"] += int(e)
                        eachJob["Warnings"] += int(w)
                    sys.stdout.buffer.flush()
                    output.write(line)
                process.wait()
                if process.returncode:
                    raise subprocess.CalledProcessError(0, " ".join(command))
                eachJob["run_complete"] = True
                if not eachJob["Errors"]:
                    eachJob["status"] = True
        except:
            logger.exception("Failed to execute openfpga flow - " +
                             eachJob["name"])
            if not args.continue_on_fail:
                os._exit(1)
        eachJob["endtime"] = time.time()
        timediff = timedelta(seconds=(eachJob["endtime"]-eachJob["starttime"]))
        timestr = humanize.naturaldelta(timediff) if "humanize" in sys.modules \
            else str(timediff)
        eachJob["exectime"] = timestr
        logger.info("%s Finished with returncode %d, Time Taken %s " %
                    (thread_name, process.returncode, timestr))
        eachJob["finished"] = True
        no_of_finished_job = sum([not eachJ["finished"] for eachJ in job_list])
        logger.info("***** %d runs pending *****" % (no_of_finished_job))


def collect_result(result_file, result_obj):
    colnames = ["status", "Errors", "Warnings",
                "run_complete", "exectime", "finished", "logfile"]
    if len(result_obj):
        with open(result_file, 'w', newline='') as csvfile:
            writer = csv.DictWriter(
                csvfile, extrasaction='ignore', fieldnames=colnames)
            writer.writeheader()
            for eachResult in result_obj:
                writer.writerow(eachResult)
    logger.info("= = = ="*10)
    passed_jobs = [each["status"] for each in result_obj]
    logger.info(f"Passed Jobs %d/%d", len(passed_jobs), len(result_obj))
    logger.info(f"Result file stored at {result_file}")
    logger.info("= = = ="*10)


if __name__ == "__main__":
    if args.debug:
        logger.info("Setting loggger in debug mode")
        logger.setLevel(logging.DEBUG)
    main()
