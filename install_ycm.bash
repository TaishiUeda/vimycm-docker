#! /bin/bash

echo "Installing YouCompleteMe..."
cd ~/.vim/bundle/YouCompleteMe
sudo apt install -y build-essential vim-nox python3-dev
sudo apt install -y nodejs default-jdk npm
python3 install.py --ts-completer --java-completer --clang-completer

