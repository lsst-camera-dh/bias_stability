if [ -v BIAS_STABILITY_SETUP ]
then
   return 0
fi

# set up the requested shared stack
shared_stack_dir=$1

LSST_DISTRIB=${shared_stack_dir}
if [[ -f ${LSST_DISTRIB}/loadLSST-ext.bash ]]; then
    source ${LSST_DISTRIB}/loadLSST-ext.bash
    setup lsst_distrib
else
    source ${LSST_DISTRIB}/loadLSST.bash
    setup lsst_distrib -t $(basename "$shared_stack_dir")
fi

export OMP_NUM_THREADS=1
export NUMEXPR_MAX_THREADS=1
export OMP_PROC_BIND=false

package_dir=/sps/lsst/users/tguillem/Rubin/stack/w_2023_49
setup -r ${package_dir}/eo_pipe -j
setup -r ${package_dir}/bias_stability

export BIAS_STABILITY_SETUP=true
export BIAS_STABILITY_DIR=${package_dir}/bias_stability
export EO_PIPE_DIR=${package_dir}/eo_pipe

export PAYLOAD_MODIFIER=""
export SUBSELECTION=""
