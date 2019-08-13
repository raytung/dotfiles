#!/bin/bash

set -eu

cd "$(dirname "$0")"

source ../../functions.sh

install_pkg apt-transport-https

K8S_SRC_LIST="deb https://apt.kubernetes.io/ kubernetes-xenial main"
K8S_SRC_LIST_FILE="/etc/apt/sources.list.d/kubernetes.list"

[ -f "${K8S_SRC_LIST_FILE}" ] || sudo touch ${K8S_SRC_LIST_FILE}

if [ "$(grep "${K8S_SRC_LIST}" "${K8S_SRC_LIST_FILE}")" = "" ]; then
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  echo "${K8S_SRC_LIST}" | sudo tee -a ${K8S_SRC_LIST_FILE}
  sudo apt update
  apt_install kubectl
fi
