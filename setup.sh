#!/bin/bash

set -e
set -o pipefail

cd "$(dirname "$0")"

source ./functions.sh


echo "--- $(date) Installing apt packages"
[ -n "${SKIP_UPDATE}" ] || sudo apt update --yes

install_pkg \
  build-essential \
  ca-certificates \
  xclip \
  zsh \
  pkg-config \
  zip \
  unzip \
  g++ \
  zlib1g-dev \
  python3 \
  python3-pip \
  curl \
  git \
  mercurial \
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
  google-cloud-sdk \
  terraform \
  awscli \
  thefuck \
  libssl-dev \
  slack-desktop \
  fonts-powerline \
  kubectl \
  signal-desktop \
  tilix \
  htop \
  moreutils \
  google-chrome-stable
