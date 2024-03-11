These are the steps performed to get started with Sparta using UND Talon
If you are on a non-UND computer, download the VPN first at this link https://und.teamdynamix.com/TDClient/2048/IT/KB/ArticleDet?ID=63058

Log into the VPN, and open UND Talon OnDemand, follow the rules and instructions here https://und.edu/research/computational-research-center/tutorials/index.html
![image](https://github.com/ComputationalGasDynamicsLab/sparta_cases/assets/10146286/a6ec2dac-4aa6-4509-8897-4b6d0700a61b)

Open the Shell, or terminal to access the linux command line interface.
![image](https://github.com/ComputationalGasDynamicsLab/sparta_cases/assets/10146286/87eb52ea-1463-44d8-a0bb-ebdc04835817)

This is where you will be primarily running commands for the simulations.
![image](https://github.com/ComputationalGasDynamicsLab/sparta_cases/assets/10146286/cd388a26-8725-4d0b-b333-07b7020cd32b)

**Do not run the simulation on the head node**, always run the simulations by using the "sbatch" command. Only running  small scripts that simply install software or other linux add-ons are acceptable to run on the head node.


1. Installing Sparta.
Sparta Download link: https://sjplimp.github.io//tars/sparta.tar.gz
Sparta Homepage Directory: https://sparta.github.io/
Sparta Build Scripts: https://github.com/ComputationalGasDynamicsLab/sparta_build_scripts
copy and paste the commands as follows:

```
#cd ~
#wget https://github.com/ComputationalGasDynamicsLab/sparta_cases/tree/Jalen3/install_sparta.sh
#chmod +x install_sparta.sh && ./install_sparta.sh
cd ~
wget https://sjplimp.github.io//tars/sparta.tar.gz .
mkdir sparta_root && tar -xzf sparta.tar.gz -C sparta_root --strip-components 1
mkdir ~/sparta_root/build_cpu && mkdir ~/sparta_root/build_gpu
#had issues using Wget
#wget https://github.com/ComputationalGasDynamicsLab/sparta_build_scripts/blob/main/talon/build_sparta.sh -o ~/sparta_root/build_cpu/build_sparta.sh
#wget https://github.com/ComputationalGasDynamicsLab/sparta_build_scripts/blob/main/talon/build_sparta_kokkos.sh ~/sparta_root/build_gpu/build_sparta_kokkos.sh
#chmod +x ~/sparta_root/build_cpu/build_sparta.sh && chmod +x ~/sparta_root/build_cpu/build_sparta_kokkos.sh

cd ~/sparta_root/build_cpu  
# load required modules
module load gcc/11.2.0
module load cmake/3.21.3
module load mpich/ge/gcc/64/3.3.2

# export required environment variables for configuration and build
export buildroot=$PWD
export srcroot=$buildroot/../
export installroot=$buildroot/../install




cmake $srcroot $srcroot/cmake \
               -DCMAKE_BUILD_TYPE=Release \
               -DCMAKE_CXX_COMPILER=mpicxx \
               -DCMAKE_INSTALL_PREFIX=$installroot \
               -DSPARTA_MACHINE=talon \
	       -DSPARTA_ENABLE_TESTING=OFF \
	       -DBUILD_JPEG=ON \
	       -DBUILD_PNG=ON
make -j4 install

cd ../build_gpu
# load required modules
module load gcc/11.2.0
module load cmake/3.21.3
module load mpich/ge/gcc/64/3.3.2
module load cuda11.8/toolkit/11.8.0

# export required environment variables for configuration and build
export buildroot=$PWD
export srcroot=$buildroot/../
export installroot=$buildroot/../install

export kksrc=$srcroot/lib/kokkos
export MPICH_CXX=$kksrc/bin/nvcc_wrapper

cmake $srcroot $srcroot/cmake \
               -DCMAKE_BUILD_TYPE=Release \
               -DCMAKE_CXX_COMPILER=mpicxx \
               -DCMAKE_INSTALL_PREFIX=$installroot \
       	       -DSPARTA_MACHINE=kokkos_talon \
	       -DSPARTA_ENABLE_TESTING=OFF \
               -DPKG_KOKKOS=ON \
               -DKokkos_ARCH_VOLTA70=ON \
	       -DBUILD_KOKKOS=ON \
               -DKokkos_ENABLE_CUDA=ON \
	       -DKokkos_ENABLE_CUDA_LAMBDA=ON \
               -DKokkos_ENABLE_DEBUG=ON \
               -DKokkos_ENABLE_OPENMP=OFF \
	       -DKokkos_ENABLE_SERIAL=ON \
	       -DBUILD_JPEG=ON \
	       -DBUILD_PNG=ON

make -j8 install

cd ~ && rm -rf sparta.tar.gz
```
To get example sparta case files, download them from the git repository. 

```
cd ~ && mkdir DSMC && cd DSMC
git clone https://github.com/ComputationalGasDynamicsLab/sparta_cases
```
Running the simulation:

In order to run a simulation, you need spa_talon, or spa_kokkos_talon in the directory of the simulation scripts itself
Run the commands as follows:

```
cp ~/sparta_root/install/bin/spa_talon ~/DSMC/sparta_cases/2D_flow_over_cylinder/2D_flow_over_cylinder_CPU
cp ~/sparta_root/install/bin/spa_kokkos_talon ~/DSMC/sparta_cases/2D_flow_over_cylinder/2D_flow_over_cylinder_GPU
cd ~/DSMC/sparta_cases/2D_flow_over_cylinder/2D_flow_over_cylinder_GPU
```
To run the simulation, you must run it on a compute node; never run a simulation on the head node. Always use the "sbatch" command and never the "./" command for running the simulation.

```
sbatch run_talon.sh
```
To check your queue during runtime against other UND Talon users, run the command:

```
squeue
```

or 

```
squeue -u your_und.username

To convert the output into a format readable by Paraview. You must install the paraview tool kit. Run the commands as follows/

```
cd ~
wget -O p.tar.gz "https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.12&type=binary&os=Linux&downloadFile=ParaView-5.12.0-egl-MPI-Linux-Python3.10-x86_64.tar.gz"
mkdir Paraview && tar -xzf p.tar.gz -C Paraview --strip-components 1
echo "export PATH=$PATH:~/ParaView/bin" >> .bashrc
```
Once the simulation is finished, you to post process you need to run the pvpython scripts in the paraview_initialization_scripts folder
![image](https://github.com/ComputationalGasDynamicsLab/sparta_cases/assets/10146286/132db81b-21f0-4a76-9b10-ecb8b605ef99)

Run the commands on the head node. These are fine because they are not computationally intensive.
```
./grid_conversion.sh
./surf_conversion.sh
```
Under the Talon Dashboard start a Paraview session under the GPU cores.
![image](https://github.com/ComputationalGasDynamicsLab/sparta_cases/assets/10146286/649461c8-61cd-4b59-bb17-dbcd68f36260)

