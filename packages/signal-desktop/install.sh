#!/bin/bash

set -e

cd "$(dirname "$0")"

source ../../functions.sh

cat ./keys.asc | sudo apt-key add -

if ! [ -f "/etc/apt/sources.list.d/signal-xenial.list" ]; then
  echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
	sudo apt update
fi

apt_install signal-desktop
