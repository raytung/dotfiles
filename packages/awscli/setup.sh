#!/bin/bash

cd "$(dirname "$0")"

is_awscli_installed() {
  pip3 show "$1"
}

source ../../functions.sh

apt_install python3-pip

if ! is_awscli_installed; then
  pip3 install awscli --upgrade --user
fi
