SPARTA test case fro 2D flow over flat plate.
 - `run_centos_desktop.sh` can be used to run the simulation on desktop computer
 - `run_talon.sh` is the job submission script for UND's Talon HPC cluster;
   - To submit job, use `sbatch run_talon.sh`.
 - `run_polaris.sh` is the job submission script for ALCF Polaris computer;
   - To submit job, use `sbatch run_polaris.sh`.
 - job scripts are stored in the subfolder `run_scripts`.

- To dump png file, use `in.circle` input file in the job script;
- To dump surface and grid data, use `in.circle_dump_surf_grid` input file in the job script.
    
