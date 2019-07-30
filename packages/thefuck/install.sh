#!/bin/bash

set -e
set -u

cd "$(dirname "$0")"

source ../../functions.sh

apt_install python3-dev python3-pip python3-setuptools
pip3 install thefuck
