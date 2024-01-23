# bias_stability
This package contains bps configuration files for running cp_pipe and eo_pipe pielines to do bias stability analyses on LSSTCam for several different ISR configurations.  These include three different overscan correction methods:
1. Parallel + serial median-per-row
2. Serial median-per-row only
3. Serial mean only
Combined bias and dark frames are generated in each case so that consistent ISR configurations are used at each step.

## Set up
Copy `scripts/setup_base.sh` to a standard location and edit the line
```
package_dir=/sdf/home/j/jchiang/dev
```
to point to the directory where the `eo_pipe` and `bias_stability` packages are installed.  Then copy `scripts/setup.sh` (renaming as appropriate), to a working directory and edit the line
```
source /sdf/home/j/jchiang/dev/bias_stability/scripts/setup_base.sh ${shared_stack_dir}
```
to point at the location where you've installed `setup_base.sh`.  All of the site- and run-dependent configurations in the bps yaml files are set via environment variables in `setup.sh`, so these should be set accordingly for the runtime environment used by the bps submissions.

## Example: Analyzing the full focalplane data at USDF for run 13555.
We'll use B-protocol run 13550 to generate the combined bias and dark frames.  Here's an excerpt from the setup.sh file with the relevant environment variables set:
```
version=`eups list lsst_distrib -s | sed 's/\s\+/\n/g' | grep [dw]_[0-9]*_[0-9]*`
export WEEKLY=${version}
export BUTLER_CONFIG=/repo/ir2
export BIAS_STABILITY_RUN=13555
export CALIB_RUN=13550
export PAYLOAD_MODIFIER=""
export SUBSELECTION=""
export BIAS_STABILITY_INCOLLECTION=u/${USER}/dark${PAYLOAD_MODIFIER}_${CALIB_RUN}_${WEEKLY}
export INSTRUMENT_CLASS_NAME=LsstCam
export INSTRUMENT_CLASS=lsst.obs.lsst.${INSTRUMENT_CLASS_NAME}
export INSTRUMENT_NAME=LSSTCam
```
After sourcing the updated `setup.sh` file, one can either copy or symlink the bps files to the local working directory, e.g.,
```
$ ln -s $BAIS_STABILITY_DIR/bps/bps* .
```
To generate the bias stability results for the parallel+serial overscan configurtion, run the following three pipelines in succession:
```
$ bps submit bps_cpBias_P+S.yaml
$ bps submit bps_cpDark_P+S.yaml
$ bps submit bps_eoBiasStability_P+S.yaml
```
For the `serial_median` and `serial_mean` cases, the corresponding bps yaml files would be run in the same fashion.