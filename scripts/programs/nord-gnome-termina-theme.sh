#!/bin/bash

echo "😎️ installing nord theme gnome terminal"

if [ -d "$HOME/.nord-gnome-terminal" ]
then
    echo "😎️ nord-gnome-terminal already installed!!"
    exit
fi

git clone https://github.com/arcticicestudio/nord-gnome-terminal.git "$HOME/.nord-gnome-terminal"
cd $HOME/.nord-gnome-terminal/src
./nord.sh
