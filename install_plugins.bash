#! /bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git
git clone https://github.com/tomasr/molokai.git

current_dir=`pwd`
bundledir=$HOME/.vim/bundle
if [ -e $bundledir ]; then
    echo "$bundledir already exists.\n"
else
    echo "$bundledir is made.\n"
    mkdir -p $bundledir
fi
echo "Vundle.vim is copied to $bundledir\n"
cp -r Vundle.vim $bundledir

molokaidir=$HOME/.vim/bundle/molokai
if [ -e $molokaidir ]; then
    echo "$molokaidir already exists.\n"
else
    echo "$molokaidir is made.\n"
    mkdir -p $molokaidir
fi
echo "molokai is copied to $bundledir\n"
cp -r molokai $bundledir
cp -r molokai/colors $HOME/.vim/

vimrc=$HOME/.vimrc
if [ -e $vimrc ]; then
    read -p $vimrc" already exists. Do you overwrite it? (y/N): " yn
    case "$yn" in [yY]*) ;; *) echo "abort." ; exit ;; esac
else
    echo ".vimrc is copied to $HOME"
fi

cp .vimrc $HOME

echo "Installing bundle plugins..."
vim -c "BundleUpdate" -c qa > /dev/null 2>&1
echo "Done."

echo "Install python syntax checker..."
sudo apt install -y python3-pip pylint flake8
python3 -m pip install pylint flake8

echo "Downloading SKK dictionary..."
sudo apt install -y curl
curl -O http://openlab.ring.gr.jp/skk/skk/dic/SKK-JISYO.L

eskk=$HOME/.eskk
if [ -e $eskk ]; then
    echo "$eskk already exists.\n"
else
    mkdir -p $eskk
    echo "$eskk is made.\n"
fi
mv SKK-JISYO.L $eskk

echo "Complete."

cd $current_dir
sudo rm -r Vundle.vim
sudo rm -r molokai

