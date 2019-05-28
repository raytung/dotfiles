#!/bin/bash

cd "$(dirname "$0")"

source ../../functions.sh

if ! apt_installed nodejs; then
  sudo ./setup_12.x.sh
  apt_install nodejs
fi

