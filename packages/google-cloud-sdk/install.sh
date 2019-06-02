#!/bin/bash

set -e
set -o pipefail
set -u

cd "$(dirname "$0")"

source ../../functions.sh

apt_install apt-transport-https

CLOUD_SDK_REPO="cloud-sdk-$(grep VERSION_CODENAME /etc/os-release | cut -d '=' -f 2)"
CLOUD_SDK_REPO_FULL="deb https://packages.cloud.google.com/apt ${CLOUD_SDK_REPO} main"
CLOUD_SDK_SOURCE_LIST="/etc/apt/sources.list.d/google-cloud-sdk.list"

if ! custom_apt_repo_exists "${CLOUD_SDK_REPO}" "${CLOUD_SDK_SOURCE_LIST}"; then
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
	echo "${CLOUD_SDK_REPO_FULL}" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
fi

if ! apt_installed google-cloud-sdk; then
	sudo apt update
fi

apt_install google-cloud-sdk
