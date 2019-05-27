#!/bin/bash

set -eu
set -o pipefail

is_custom_pkg() {
  local pkg_name="$1"

  [ -x "$(dirname "$0")/packages/${pkg_name}/install.sh" ]
}

install_pkg() {
  for pkg in ${@}; do
    echo "--- $(date) Installing ${pkg}"

    if is_custom_pkg "${pkg}"; then
      "$(dirname "$0")/packages/${pkg}/install.sh"

      continue
    fi

    local APT_STATUS=$(dpkg-query --show --showformat='${Status}' "${pkg}" | grep "install ok installed")

    if [ "" == "${APT_STATUS}" ]; then
      sudo apt install --yes "${pkg}"
    fi
  done
}
