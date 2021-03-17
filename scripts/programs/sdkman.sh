#!/bin/bash

echo "☕️ Installing SDK-man!"

if [ -d "$HOME/.sdkman" ]
then
    echo "☕️ SDK-man! already installed!!"
    exit
fi

curl -s "https://get.sdkman.io?rcupdate=false" | bash
