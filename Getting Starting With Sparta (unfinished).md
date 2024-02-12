These are the steps performed to get started with Sparta using UND Talon
If you are on a non-UND computer, download the VPN first at this link https://und.teamdynamix.com/TDClient/2048/IT/KB/ArticleDet?ID=63058

Log into the VPN, and open UND Talon OnDemand, follow the rules and instructions here https://und.edu/research/computational-research-center/tutorials/index.html
![image](https://github.com/ComputationalGasDynamicsLab/sparta_cases/assets/10146286/a6ec2dac-4aa6-4509-8897-4b6d0700a61b)

Open the Shell, or terminal to access the linux command line interface.
![image](https://github.com/ComputationalGasDynamicsLab/sparta_cases/assets/10146286/87eb52ea-1463-44d8-a0bb-ebdc04835817)

This is where you will be primarily running commands for the simulations.
![image](https://github.com/ComputationalGasDynamicsLab/sparta_cases/assets/10146286/cd388a26-8725-4d0b-b333-07b7020cd32b)

Do not run the simulation on the head node, always run the simulations by using the "sbatch" command. Only running  small scripts that simply install software or other linux add-ons are acceptable to run on the head node.


1. Installing Sparta.
Sparta Download link: https://sjplimp.github.io//tars/sparta.tar.gz
Sparta Homepage Directory: https://sparta.github.io/
Sparta Build Scripts: https://github.com/ComputationalGasDynamicsLab/sparta_build_scripts
run the commands as follows:

```
cd ~
wget https://github.com/ComputationalGasDynamicsLab/sparta_cases/tree/Jalen3/install_sparta.sh
chmod +x install_sparta.sh && ./install_sparta.sh
wget https://sjplimp.github.io//tars/sparta.tar.gz .
mkdir sparta_root && tar -xzf sparta.tar.gz -C sparta_root --strip-components 1
mkdir ~/sparta_root/build_cpu && mkdir ~/sparta_root/build_gpu
wget https://github.com/ComputationalGasDynamicsLab/sparta_build_scripts/blob/main/talon/build_sparta.sh -o ~/sparta_root/build_cpu/build_sparta.sh
wget https://github.com/ComputationalGasDynamicsLab/sparta_build_scripts/blob/main/talon/build_sparta_kokkos.sh ~/sparta_root/build_gpu/build_sparta_kokkos.sh
chmod +x ~/sparta_root/build_cpu/build_sparta.sh && chmox +x ~/sparta_root/build_cpu/build_sparta_kokkos.sh
cd ~/sparta_root/build_cpu && ./build_sparta.sh && cd ../build_gpu && ./build_sparta_kkokos.sh

cd ~ && rm -rf sparta.tar.gz
```
