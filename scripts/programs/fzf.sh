#!/bin/bash

echo "😎️ installing fzf"

if [ -d "$HOME/.fzf" ]
then
    echo "😎️ fzf already installed!!"
    exit
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

