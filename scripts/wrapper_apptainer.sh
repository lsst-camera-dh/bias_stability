#!/bin/bash

stack_release=$1
TASK_COMMAND=${@:2}

hostname 1>&2
echo $SLURM_JOBID 1>&2

/cvmfs/sw.lsst.eu/linux-x86_64/apptainer/v1.1.4/bin/apptainer exec --cleanenv --env TMPDIR=$TMPDIR --bind /sps:/sps --bind /pbs:/pbs --bind /scratch:/scratch /cvmfs/sw.lsst.eu/containers/apptainer/lsst_distrib/${stack_release}.sif bash -l -c "source /opt/lsst/software/stack/loadLSST.bash ; setup lsst_distrib ; setup -r /sps/lsst/users/tguillem/Rubin/stack/w_2023_49/eo_pipe -j ; setup -r /sps/lsst/users/tguillem/Rubin/stack/w_2023_49/bias_stability -j ; export OMP_NUM_THREADS=1 ; export PYTHONNOUSERSITE=' ' ; $TASK_COMMAND"
