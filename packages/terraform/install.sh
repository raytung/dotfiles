#!/bin/bash

set -e

cd "$(dirname "$0")"

source ../../functions.sh

terraform_exists() {
  which terraform
}

apt_install golang

if ! terraform_exists; then
  go get -u github.com/hashicorp/terraform
fi
