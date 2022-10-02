#!/usr/bin/env bash

# the ESP-IDF needs to be checked out in chromatron/src/hal
# don't forget to setup submodules!
# git submodule init
# git submodule update

./install.sh
. ./export.sh

pushd examples/wifi/power_save
# idf.py fullclean
idf.py build
popd
