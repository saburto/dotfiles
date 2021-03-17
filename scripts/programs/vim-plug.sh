#!/bin/bash

echo "🔌️ installing vim-plug"

if [ -f "$HOME/.vim/autoload/plug.vim" ]
then
    echo "🔌️ vim-plug already installed!!"
    exit
fi

curl -flo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "remember to execute :pluginstall"
