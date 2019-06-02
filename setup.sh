#!/bin/bash

set -e
set -o pipefail

cd "$(dirname "$0")"

source ./functions.sh


echo "--- $(date) Installing apt packages"
[ -n "${SKIP_UPDATE}" ] || sudo apt update --yes

install_pkg \
  zsh \
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
  diff-so-fancy \
  jq \
  tree \
  strace \
  nodejs \
  yarn \
  nord-gnome-terminal \
  google-cloud-sdk
