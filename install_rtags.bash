#! /bin/bash
#
# install_rtags.bash
# Copyright (C) 2022 qibitech
#
sudo apt install -y clang 
sudo apt install -y llvm-dev libclang-dev
git clone --recursive https://github.com/Andersbakken/rtags.git
cd rtags
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .
make
sudo make install

cd ..
sudo rm -r rtags


