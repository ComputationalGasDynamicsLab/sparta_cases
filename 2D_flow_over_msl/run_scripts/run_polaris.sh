#!/bin/bash -l
#PBS -N DSMC_flatplate
#PBS -l select=1:ncpus=4
#PBS -l walltime=0:10:00
#PBS -q debug
#PBS -A hypersonic01
#PBS -l filesystems=home:grand:eagle

module load PrgEnv-gnu/8.3.3
module load cudatoolkit-standalone/11.8.0
module load cmake/3.23.2

NNODES=`wc -l < $PBS_NODEFILE`
NRANKS_PER_NODE=4 # Number of MPI ranks to spawn per node
NDEPTH=16 # Number of hardware threads per rank (i.e. spacing between MPI ranks)
NTHREADS=1 # Number of software threads per rank to launch (i.e. OMP_NUM_THREADS)
NTOTRANKS=$(( NNODES * NRANKS_PER_NODE ))
num_gpus=${NTOTRANKS}
echo "NUM_OF_NODES= ${NNODES} TOTAL_NUM_RANKS= ${NTOTRANKS} RANKS_PER_NODE= ${NRANKS_PER_NODE} THREADS_PER_RANK= ${NTHREADS}"

cd ${PBS_O_WORKDIR}
mpiexec -n ${NTOTRANKS} --ppn ${NRANKS_PER_NODE} --depth=${NDEPTH} -env \
OMP_NUM_THREADS=${NTHREADS} --cpu-bind depth ./set_affinity_gpu_polaris.sh \
./spa_polaris -in in.flatplate

# note: refer to Polaris queue policy for node and time limit on each queue: https://docs.alcf.anl.gov/polaris/running-jobs/. 
