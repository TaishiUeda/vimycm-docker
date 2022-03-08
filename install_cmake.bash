#! /bin/bash
sudo apt install -y wget libssl-dev g++-8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8

echo "Installing cmake 3.17..."
wget https://github.com/Kitware/CMake/releases/download/v3.17.1/cmake-3.17.1.tar.gz
tar zxvf cmake-3.17.1.tar.gz
cd cmake-3.17.1/
./bootstrap
make
sudo make install
cd ..
rm -r cmake-3.17.1
