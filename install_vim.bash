#! /bin/bash
sudo apt update
sudo apt install -y git
sudo apt install -y make
sudo apt install -y clang
sudo apt install -y libtool-bin
# Add X windows clipboard support (also needed for GUI):
sudo apt install -y libxt-dev
# Add GUI support:
sudo apt install -y libgtk-3-dev
# Add Python 3 support:
sudo apt install -y libpython3-dev

# Build Vim with default features:
git clone https://github.com/vim/vim.git
cd vim/src
sed -i '0,/#CONF_OPT_PYTHON3 = --enable-python3interp/ s/#CONF_OPT_PYTHON3 = --enable-python3interp/CONF_OPT_PYTHON3 = --enable-python3interp/' Makefile 
make
sudo make install

# remove git resources
cd ../..
sudo rm -r vim
