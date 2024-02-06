#sbatch /pbs/throng/lsst/software/parsl/tools/bps_submit.sh bps_eoBiasStability_serial_median.yaml w_2023_49
#sbatch bps_submit.sh bps_eoBiasStability_serial_median.yaml w_2023_49

#all configurations
export stamp=w_2023_49_20240206d
#sbatch bps_submit.sh ${package_dir}/bias_stability/bps/stability/bps_eoBiasStability_0D.yaml w_2023_49
sbatch bps_submit.sh ${package_dir}/bias_stability/bps/stability/bps_eoBiasStability_0D_MB.yaml w_2023_49
sbatch bps_submit.sh ${package_dir}/bias_stability/bps/stability/bps_eoBiasStability_0D_MD15.yaml w_2023_49
sbatch bps_submit.sh ${package_dir}/bias_stability/bps/stability/bps_eoBiasStability_0D_MD30.yaml w_2023_49

#sbatch bps_submit.sh ${package_dir}/bias_stability/bps/stability/bps_eoBiasStability_1D.yaml w_2023_49
sbatch bps_submit.sh ${package_dir}/bias_stability/bps/stability/bps_eoBiasStability_1D_MB.yaml w_2023_49
sbatch bps_submit.sh ${package_dir}/bias_stability/bps/stability/bps_eoBiasStability_1D_MD15.yaml w_2023_49
sbatch bps_submit.sh ${package_dir}/bias_stability/bps/stability/bps_eoBiasStability_1D_MD30.yaml w_2023_49

#sbatch bps_submit.sh ${package_dir}/bias_stability/bps/stability/bps_eoBiasStability_2D.yaml w_2023_49
sbatch bps_submit.sh ${package_dir}/bias_stability/bps/stability/bps_eoBiasStability_2D_MB.yaml w_2023_49
sbatch bps_submit.sh ${package_dir}/bias_stability/bps/stability/bps_eoBiasStability_2D_MD15.yaml w_2023_49
sbatch bps_submit.sh ${package_dir}/bias_stability/bps/stability/bps_eoBiasStability_2D_MD30.yaml w_2023_49
