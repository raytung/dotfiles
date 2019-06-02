#!/bin/bash

set -eu
set -o pipefail

cd "$(dirname "$0")"

source ../../functions.sh

install_pkg \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    software-properties-common

DOCKER_FINGERPRINT="0EBFCD88"
DOCKER_APT_REPO="deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
ESCAPED_DOCKER_APT_REPO="$(printf "%q" "${DOCKER_APT_REPO}")"
DOCKER_APT_REPO_STATUS="$(grep "${ESCAPED_DOCKER_APT_REPO}" /etc/apt/sources.list)"

if [ "${DOCKER_APT_REPO_STATUS}" == "" ]; then
  sudo add-apt-repository "${DOCKER_APT_REPO}"
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
  sudo apt-key fingerprint "${DOCKER_FINGERPRINT}"

  sudo apt-get -qqy update
fi

apt_install docker-ce docker-ce-cli containerd.io

if ! [ -L "${HOME}/.docker/config.json" ]; then
  ABS_PATH="$(readlink -f ./config.json)"
  ln --symbolic "${ABS_PATH}" "${HOME}/.docker/config.json"
fi

DOCKER_GROUP_NAME="docker"
DOCKER_GROUP_STATUS="$(grep "${DOCKER_GROUP_NAME}" /etc/group)"
if [ "${DOCKER_GROUP_STATUS}" == "" ]; then
  sudo groupadd docker
fi

USER_GROUPS_STATUS="$(groups "$(whoami)") | grep \"${DOCKER_GROUP_NAME}\""
if [ "${USER_GROUPS_STATUS}" == "" ]; then
  sudo usermod -aG "${DOCKER_GROUP_NAME}" "$(whoami)"
  newgrp - docker
fi

