#!/bin/bash

apt-get install -qqy \
  libvirt-clients \
  libvirt-daemon-system \
  qemu-kvm

systemctl enable libvirtd.service
systemctl start libvirtd.service

usermod -a -G libvirt $(whoami)

newgrp libvirt

curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2 \
  && sudo install docker-machine-driver-kvm2 /usr/local/bin/
