#!/bin/bash

set -e
set -o pipefail

cd "$(dirname "$0")"

source ./functions.sh


echo "--- $(date) Installing apt packages"
sudo apt update --yes
install_pkg \
  pkg-config \
  zip \
  unzip \
  g++ \
  zlib1g-dev \
  python3 \
  curl \
  git \
  golang \
  rustup \
  tree \
  shellcheck \
  wireshark \
  neovim \
  docker \
  diff-so-fancy
