#!/bin/bash

set -e

cd "$(dirname "$0")" || exit 1

echo "--- $(date) Installing NixOS"
./install_nix.sh

nix-channel --update nixpkgs

nix-env -u

NIXPKGS_ALLOW_UNFREE=1 nix-env --install --file ./packages/default.nix --show-trace

echo "--- $(date) Installing system services"
[[ -n "${SKIP_DOCKER}" ]] || ./packages/docker/install.sh
[[ -n "${SKIP_KVM}" ]] || ./packages/kvm2/install.sh
