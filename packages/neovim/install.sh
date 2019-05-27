#!/bin/bash

set -e
set -u

cd "$(dirname "$0")"

source ../../functions.sh

apt_install neovim

if ! [ -d ~/.vim/bundles ]; then
  mkdir -p ~/.vim/bundles/
  ./dein_installer.sh ~/.vim/bundles
fi

if ! [ -L "${HOME}/.vimrc" ]; then
  ABS_PATH="$(readlink -f ./vimrc)"
  ln --symbolic "${ABS_PATH}" "${HOME}/.vimrc"
fi

nvim --headless +InstallDein +qa
echo
