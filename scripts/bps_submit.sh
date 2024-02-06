#!/bin/bash
#SBATCH --mem=32G
#SBATCH --job-name=bps
#SBATCH --ntasks=1
#SBATCH --time=3-00:00 
#SBATCH --account=lsst
#SBATCH --partition=lsst,htc

# Usage:
# $ sbatch bps_submit.sh <submit_file.yaml> <stack_release>

export submitfile=$1
export stack_release=$2

submitfilename="$(basename ${submitfile})"
timestamp=$(date +%d-%m-%Y_%H-%M-%S)
logfilepath=logs/log_${submitfilename}_${timestamp}.out

source /pbs/throng/lsst/software/parsl/tools/env.sh $stack_release
setup -r /sps/lsst/users/tguillem/Rubin/stack/w_2023_49/eo_pipe -j
setup -r /sps/lsst/users/tguillem/Rubin/stack/w_2023_49/bias_stability -j

echo "Launching bps submission..."

echo "Node where bps is running: $SLURM_JOB_NODELIST" > $logfilepath
echo "Corresponding Slurm job ID $SLURM_JOBID" >> $logfilepath
echo "Python used:" >> $logfilepath
which python >> $logfilepath
echo " " >> $logfilepath

ulimit -u $(ulimit -H -u)
ulimit -n $(ulimit -H -n)

bps --long-log submit $submitfile 1>>$logfilepath 2>>$logfilepath
