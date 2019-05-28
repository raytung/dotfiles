#!/bin/bash

set -eu
set -o pipefail

cd "$(dirname "$0")"

YARN_APT_REPO="deb https://dl.yarnpkg.com/debian/ stable main"
if ! [ -f /etc/apt/sources.list.d/yarn.list ]; then
  curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "${YARN_APT_REPO}" | sudo tee /etc/apt/sources.list.d/yarn.list

  sudo apt-get update -qqy && sudo apt-get install -qqy yarn
fi


