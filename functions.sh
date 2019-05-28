#!/bin/bash

set -e
set -o pipefail

is_custom_pkg() {
  local pkg_name="$1"

  [ -x "$(dirname "$0")/packages/${pkg_name}/install.sh" ]
}

apt_installed() {
   local APT_STATUS=$(dpkg-query --show --showformat='${Status}' "$1" | grep "install ok installed")
   [ "" != "${APT_STATUS}" ]
}

apt_install() {
  if ! apt_installed "$1"; then
      sudo apt install --yes "$1"
  fi
}

install_pkg() {
  for pkg in ${@}; do
    echo "--- $(date) Installing ${pkg}"

    if is_custom_pkg "${pkg}"; then
      "$(dirname "$0")/packages/${pkg}/install.sh"

      continue
    fi

    apt_install "${pkg}"
  done
}
