#!/bin/bash

set -eu

cd "$(dirname "$0")"

if ! [ -d "./diff-so-fancy" ]; then
  git clone git@github.com:so-fancy/diff-so-fancy.git ./diff-so-fancy
fi

if ! [ -L "../../bin/diff-so-fancy" ]; then
  mkdir -p ../../bin || exit 1
  ABS_PATH="$(readlink -f ./diff-so-fancy/diff-so-fancy)"
  ln --symbolic "${ABS_PATH}" ../../bin/diff-so-fancy
fi

