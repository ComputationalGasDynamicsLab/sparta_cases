2D flow over circle case with adaptive mesh refinement
 - `run_centos_desktop.sh` can be used to run the simulation on desktop computer
 - `run_talon.sh` is the job submission script for UND's Talon HPC cluster;
   - To submit job, use `sbatch run_talon.sh`.

- To dump png file, use `in.circle` input file in the job script `run_talon.sh`;
- To dump surface and grid data, use `in.circle_dump_surf_grid` input file in
 .the job script `run_talon.sh`.
    

