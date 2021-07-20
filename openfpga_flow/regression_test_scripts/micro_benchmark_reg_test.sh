#!/bin/bash

set -e
source openfpga.sh
PYTHON_EXEC=python3.8
###############################################
# OpenFPGA Shell with VPR8
##############################################
echo -e "Micro benchmark regression tests";
run-task benchmark_sweep/counter --debug --show_thread_logs
run-task benchmark_sweep/mac_units --debug --show_thread_logs

# Verify MCNC big20 benchmark suite with ModelSim
# Please make sure you have ModelSim installed in the environment
# Otherwise, it will fail
run-task benchmark_sweep/mcnc_big20 --debug --show_thread_logs
#python3 openfpga_flow/scripts/run_modelsim.py mcnc_big20 --run_sim

run-task benchmark_sweep/signal_gen --debug --show_thread_logs

# run-task benchmark_sweep/processor --debug --show_thread_logs
