#!/bin/bash
##### specify to use GPU partition
#SBATCH --partition=talon-gpu32
#SBATCH -t 3:00:00
##### Number of nodes
#SBATCH --nodes=1
##### use 1 GPU
#SBATCH --gres=gpu:1
##### Number of tasks per node
##### use 1 CPU
#SBATCH --ntasks-per-node=1
#SBATCH --job-name=dsmc_cylinder
#SBATCH --chdir=./
##### Output file.
#SBATCH -o dsmc_2d_flow.%j.out

# Changes working directory to the directory where this script is submitted from
printf 'Changing to the working directory: %s\n\n' "$SLURM_SUBMIT_DIR"
cd $SLURM_SUBMIT_DIR

# Load Necessary Modules -- Add whatever modules you need to run your program
printf 'Loading modules\n'
module load slurm
module load mpich/ge/gcc/64/3.3.2
module load cuda11.7/toolkit/11.7.1
ulimit -S -c unlimited
num_mpi_ranks=$(( SLURM_NNODES * $SLURM_NTASKS_PER_NODE ))

echo 'number of node:' ${SLURM_NNODES}
echo 'number of tasks per node:' ${SLURM_NTASKS_PER_NODE}
echo 'number of mpi ranks:' ${num_mpi_ranks}

# Run program using mpirun and with GPU
mpirun -np $num_mpi_ranks ./spa_kokkos_talon -in in.horizontal_wall -k on g 1 -sf kk

### Note: currently only uses 1 CPU and 1 GPU due to crash when multiple CPUs are used. 
