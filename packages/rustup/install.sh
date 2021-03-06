#!/bin/bash

set -e

cd "$(dirname "$0")"

if [ "$(which rustup)" == "" ]; then
    ./setup.sh -y
fi

[ -n "${SKIP_UPDATE}" ] || rustup update
