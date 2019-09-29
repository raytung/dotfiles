#!/bin/bash

set -e
set -o pipefail
set -u

cd "$(dirname "$0")"

source ../../functions.sh

CHROME_REPO="deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
CHROME_REPO_LIST="/etc/apt/sources.list.d/google-chrome.list"

if ! custom_apt_repo_exists "${CHROME_REPO}" "${CHROME_REPO_LIST}"; then
	curl  https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	echo "${CHROME_REPO}" | sudo tee -a /etc/apt/sources.list.d/google-chrome.list
fi

if ! apt_installed google-chrome-stable; then
	sudo apt update
fi

apt_install google-chrome-stable
