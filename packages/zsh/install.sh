#!/bin/bash

set -eu

cd "$(dirname "$0")"

source ../../functions.sh

apt_install zsh
chsh --shell $(which zsh)

if ! [ -L "${HOME}/.zshrc" ]; then
  ABS_PATH="$(readlink -f ./zshrc)"
  ln --symbolic "${ABS_PATH}" "${HOME}/.zshrc"
fi

./oh_my_zsh_installer.sh
