shared_stack_root=/cvmfs/sw.lsst.eu/linux-x86_64/lsst_distrib
if [ -z "$1" ]
then
#    # set up the most recently available weekly
#    foo=`/usr/bin/ls -rt ${shared_stack_root} | grep w_20`
#    weekly_version=`echo $foo | awk -F ' ' '{print $NF}'`
    weekly_version=w_2023_49
else
    # set up the requested weekly
    weekly_version=$1
fi
shared_stack_dir=${shared_stack_root}/${weekly_version}

source /sps/lsst/users/tguillem/Rubin/stack/w_2023_49/bias_stability/scripts/setup_base_FrDF.sh ${shared_stack_dir}

version=`eups list lsst_distrib -s | sed 's/\s\+/\n/g' | grep [dw]_[0-9]*_[0-9]*`
export WEEKLY=${version}
export BUTLER_CONFIG=/sps/lsst/groups/FocalPlane/SLAC/run6/butler/main/
export BIAS_STABILITY_RUN=13555
export CALIB_RUN=${BIAS_STABILITY_RUN}
export PAYLOAD_MODIFIER="_R33"
export SUBSELECTION="and detector in (144..152)"
export BIAS_STABILITY_INCOLLECTION=u/jchiang/dark${PAYLOAD_MODIFIER}_${CALIB_RUN}_${WEEKLY}
export INSTRUMENT_CLASS_NAME=LsstCam
export INSTRUMENT_CLASS=lsst.obs.lsst.${INSTRUMENT_CLASS_NAME}
export INSTRUMENT_NAME=LSSTCam

PS1="\[\033]0;\w\007\][`hostname` ${INSTRUMENT_NAME} ${version}] "
