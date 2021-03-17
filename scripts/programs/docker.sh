#!/bin/bash

echo "🐋 Installing Docker"

if command -v docker &> /dev/null
then
    echo "🐋 Docker already installed!!"
    exit
fi


echo "Adding dockers GPG keys"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "Addding docker stable repository"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io 

echo "Add my user to the docker group"
sudo usermod -aG docker saburto

echo "Verify docker is installed"
sudo docker run hello-world
