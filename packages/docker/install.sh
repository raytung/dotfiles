#!/bin/bash

sudo apt-get -qqy install \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get -qqy update
sudo apt-get -qqy install \
  docker-ce \
  docker-ce-cli \
  containerd.io

sudo groupadd docker
sudo usermod -aG docker "$(whoami)"

newgrp - docker
