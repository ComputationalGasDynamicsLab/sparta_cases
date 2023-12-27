#!/bin/bash
##### Partition to use
#SBATCH --partition=talon
#SBATCH -t 5:00:00
##### Number of nodes
#SBATCH --nodes=1
##### Number of tasks per node
##### uses 36 CPUs
#SBATCH --ntasks-per-node=36
#SBATCH --job-name=dsmc_cylinder
#SBATCH --chdir=./
##### Output file.
#SBATCH -o dsmc_2d_flow_%j.out

# Changes working directory to the directory where this script is submitted from
printf 'Changing to the working directory: %s\n\n' "$SLURM_SUBMIT_DIR"
cd $SLURM_SUBMIT_DIR

# Load Necessary Modules -- Add whatever modules you need to run your program
printf 'Loading modules\n'
module load slurm
module load mpich/ge/gcc/64/3.3.2
num_mpi_ranks=$(( SLURM_NNODES * $SLURM_NTASKS_PER_NODE ))

echo 'number of node:' ${SLURM_NNODES}
echo 'number of tasks per node:' ${SLURM_NTASKS_PER_NODE}
echo 'number of mpi ranks:' ${num_mpi_ranks}

# Run program using mpirun
# dump surface and grid data files to be processed in ParaView
mpirun -np $num_mpi_ranks ./spa_talon -in in.circle_grid_surf_dump
