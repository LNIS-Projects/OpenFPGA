#!/bin/bash
#title           : openfpga.sh
#description     : This script provides shortcut commands <bash functions>
#                  for several simple operations in OpenFPGA project
#author          : Ganesh Gore <ganesh.gore@utah.edu>
#==============================================================================

if [ -z $OPENFPGA_PATH ]; then
    echo "OPENFPGA_PATH variable not found"
    export OPENFPGA_PATH=$(pwd);
    echo "Setting OPENFPGA_PATH=${OPENFPGA_PATH}"
else
    echo "OPENFPGA_PATH=${OPENFPGA_PATH}"
fi
export OPENFPGA_SCRIPT_PATH="${OPENFPGA_PATH}/openfpga_flow/scripts"
export OPENFPGA_TASK_PATH="${OPENFPGA_PATH}/openfpga_flow/tasks"
if [ -z $PYTHON_EXEC ]; then export PYTHON_EXEC="python3"; fi

# Add yosys bin folder in PATH, this is required by yosys-plugins 
# to install plugins in yosys folder
export PATH="${OPENFPGA_PATH}/yosys/install/bin:${PATH}"

# This function checks the path and
# raises warning if the command is not executing
# inside current OpendFPGA folder
check_execution_path (){
    if [[ $1 != *"${OPENFPGA_PATH}"* ]]; then
        echo -e "\e[33mCommand is not executed from configured OPNEFPGA directory\e[0m"
    fi
}

run-task-with-modelsim () {
    echo "Script as to be run as \"run-task-with-modelsim task_name --maxthreads nb_threads other_run-modelsim_options\""
    $PYTHON_EXEC $OPENFPGA_SCRIPT_PATH/run_fpga_task.py $1 $2 $3
    $PYTHON_EXEC $OPENFPGA_SCRIPT_PATH/run_modelsim.py "$@"
}

run-task () {
    $PYTHON_EXEC $OPENFPGA_SCRIPT_PATH/run_fpga_task.py "$@"
}

clean-run () {
    rm -rf ./openfpga_flow/**/run???
}

run-modelsim () {
    $PYTHON_EXEC $OPENFPGA_SCRIPT_PATH/run_modelsim.py "$@"
}

run-flow () {
    $PYTHON_EXEC $OPENFPGA_SCRIPT_PATH/run_fpga_flow.py "$@"
}

# lists all the configure task in task directory
list-tasks () {
    check_execution_path "$(pwd)"
    tree -P 'task.conf' --prune | sed "/.* task.conf/d" | sed "/.* config/d" | sed '$d'
}

# Switch directory to root of OpenFPGA
goto-root () {
    cd $OPENFPGA_PATH
}

# Run regression test locally
run-regression-local () {
    cd ${OPENFPGA_PATH}
    bash .github/workflows/*reg_test.sh
}

# Changes directory to task directory [goto_task <task_name> <run_num[default 0]>]
goto-task () {
    if [ -z $1 ]; then
        echo "requires task name goto_task <task_name> <run_num[default 0]>"
        return
    fi
    goto_path=$OPENFPGA_TASK_PATH/$1
    # Selects the run directory
    run_num=""
    if [ ! -d $goto_path ]; then echo "Task directory not found"; return; fi
    if [[ "$2" =~ '^[0-9]+$' ]] ; then
        if ! [[ $2 == '0' ]] ; then run_num="$(printf run%03d $2)"; else run_num="latest"; fi
        if [ ! -d "$goto_path/$run_num" ]; then run_num="latest"; fi
    fi
    if [ ! -d $goto_path/$run_num ]; then
        echo "\e[33mTask run directory not found -" $goto_path/$run_num "\e[0m"
    else
        echo "Switching current dirctory to" $goto_path/$run_num
        cd $goto_path/$run_num
    fi
    # Selects benchmark directory
    select benchRun in $(ls -d **/arch | sed "s/\/arch//" | head -n 20)
    do
        [ -d ${benchRun} ] && cd ${benchRun}
        break
    done
}

# Clears enviroment variables and fucntions
unset-openfpga (){
    unset -v OPENFPGA_PATH
    unset -f list-tasks run-task run-flow goto-task goto-root >/dev/null 2>&1
}

# Allow autocompletion of task
if [[ $(ps -p $$ -oargs=) == *"zsh"* ]]; then
    autoload -U +X bashcompinit; bashcompinit;
fi

command -v shopt && shopt -s globstar
# TaskList=$(ls -tdalh ${OPENFPGA_TASK_PATH}/* | awk '{system("basename " $9)}' |  awk '{printf("%s ",$1)}')
TaskList=$(ls -tdalh ${OPENFPGA_TASK_PATH}/**/task.conf  |
awk '{print $9}' | sed -e "s/\/config\/task.conf//" |
sed -e "s/${OPENFPGA_PATH//\//\\/}\/openfpga_flow\/tasks\///" |
awk '{printf("%s ",$1)}')

complete -W "${TaskList}" goto-task
complete -W "${TaskList}" run-task
complete -W "${TaskList}" run-shell-task
complete -W "${TaskList}" run-modelsim
