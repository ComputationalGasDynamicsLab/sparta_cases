cd ~
wget "https://sjplimp.github.io//tars/sparta.tar.gz" .
mkdir sparta_root && tar -xzf sparta.tar.gz -C sparta_root --strip-components 1
mkdir ~/sparta_root/build_cpu && mkdir ~/sparta_root/build_gpu
wget "https://raw.githubusercontent.com/ComputationalGasDynamicsLab/sparta_build_scripts/main/talon/build_sparta.sh" -o ~/sparta_root/build_cpu/build_sparta.sh
wget "https://raw.githubusercontent.com/ComputationalGasDynamicsLab/sparta_build_scripts/main/talon/build_sparta_kokkos.sh" ~/sparta_root/build_gpu/build_sparta_kokkos.sh
chmod +x ~/sparta_root/build_cpu/build_sparta.sh && chmod +x ~/sparta_root/build_cpu/build_sparta_kokkos.sh
cd ~/sparta_root/build_cpu && ./build_sparta.sh && cd ../build_gpu && ./build_sparta_kkokos.sh

cd ~ && rm -rf sparta.tar.gz
cd ~
