#!/bin/bash

cd "$(dirname "$0")"

if [ "$(which rustup)" == "" ]; then
    ./setup.sh -y
fi
