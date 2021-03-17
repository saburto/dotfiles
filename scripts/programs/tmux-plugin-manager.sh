#!/bin/bash

echo "🤓️ Installing tmux plugin manager"


if [ -d "$HOME/.tmux/plugins/tpm" ]
then
    echo "🤓️ tmux plugin manager already installed!!"
    exit
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
