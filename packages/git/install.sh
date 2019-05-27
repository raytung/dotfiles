#!/bin/bash

set -eu

cd "$(dirname "$0")"

source ../../functions.sh

apt_install git

if ! [ -L "${HOME}/.gitconfig" ]; then
  ABS_PATH="$(readlink -f ./gitconfig)"
  ln --symbolic "${ABS_PATH}" "${HOME}/.gitconfig"
fi
