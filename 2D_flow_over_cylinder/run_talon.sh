#!/bin/bash
##### Partition to use
#SBATCH --partition=talon
#SBATCH -t 1:00:00
##### Number of nodes
#SBATCH --nodes=1
##### Number of tasks per node
#SBATCH --ntasks-per-node=4
#SBATCH --job-name=dsmc_2d_test
#SBATCH --chdir=./
##### Output file. This and the error file are the first two things we check when we are troubleshooting issues with your job. 
#SBATCH -o dsmc_2d_flow_%j.out
##### Error file. This and the output file are the first two things we check when we are troubleshooting issues with your job.
#SBATCH -e dsmc_2d_flow_%j.err

# Changes working directory to the directory where this script is submitted from
printf 'Changing to the working directory: %s\n\n' "$SLURM_SUBMIT_DIR"
cd $SLURM_SUBMIT_DIR

# Load Necessary Modules -- Add whatever modules you need to run your program
printf 'Loading modules\n'
module load slurm
module load mpich/ge/gcc/64/3.3.2

echo 'number of mpi ranks:' ${SLURM_NTASKS}
# Determine the job host names and write a hosts file
srun -n $SLURM_NTASKS hostname | sort -u > $SLURM_JOB_ID.hosts

# Run program using mpirun
#mpirun -np $SLURM_NTASKS -machinefile $SLURM_JOB_ID.hosts spa_talon -in in.circle
mpirun -np $SLURM_NTASKS -machinefile $SLURM_JOB_ID.hosts spa_talon

# Remove Hosts file
rm ${SLURM_JOB_ID}.hosts
