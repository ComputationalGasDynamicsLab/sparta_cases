These are the steps performed to get started with Sparta using UND Talon
If you are on a non-UND computer, download the VPN first at this link https://und.teamdynamix.com/TDClient/2048/IT/KB/ArticleDet?ID=63058

Log into the VPN, and open UND Talon OnDemand, follow the rules and instructions here https://und.edu/research/computational-research-center/tutorials/index.html
![image](https://github.com/ComputationalGasDynamicsLab/sparta_cases/assets/10146286/a6ec2dac-4aa6-4509-8897-4b6d0700a61b)

Open the Shell, or terminal to access the linux command line interface.
![image](https://github.com/ComputationalGasDynamicsLab/sparta_cases/assets/10146286/87eb52ea-1463-44d8-a0bb-ebdc04835817)

This is where you will be primarily running commands for the simulations.
![image](https://github.com/ComputationalGasDynamicsLab/sparta_cases/assets/10146286/cd388a26-8725-4d0b-b333-07b7020cd32b)

Do not run the simulation on the head node, always run the simulations by using the "sbatch" command. Only running  small scripts that simply install software or other linux add-ons are acceptable to run on the head node.


1. Download Sparta and extract it in your home directory.
Download link: https://sjplimp.github.io//tars/sparta.tar.gz
Sparta Homepage Directory: https://sparta.github.io/

run the command as follows:
cd ~
wget https://sjplimp.github.io//tars/sparta.tar.gz .
tar -xzf sparta.tar.gz
rm -rf sparta.tar.gz
