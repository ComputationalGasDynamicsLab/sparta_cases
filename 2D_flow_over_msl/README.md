SPARTA test case for 2D flow over flat plate.
 - `run_centos_desktop.sh` can be used to run the simulation on desktop computer
 - `run_talon.sh` is the job submission script for UND's Talon HPC cluster;
   - To submit job, use `sbatch run_talon.sh`.
 - `run_polaris.sh` is the job submission script for ALCF Polaris computer with GPU binary;
   - To submit job, use `qsub run_polaris.sh`.
   - `set_affinity_gpu_polaris.sh` file is needed to set the GPU affinity.
   - currently, `debug` queue is used on Polaris. Different job queue may be used if more computing nodes are used.
 - job scripts are stored in the subfolder `run_scripts`.

- To dump png file, use `in.msl` input file in the job script;
- To dump surface and grid data, use `in.msl_dump_surf_grid` input file in the job script. More updates need to be made to this file
- Need to write in chemical reactions into in.msl     

