#!/usr/bin/env bash

# the ESP-IDF needs to be checked out in chromatron/src/hal
# don't forget to setup submodules!
# git submodule init
# git submodule update

./install.sh
. ./export.sh

pushd examples/build_system/cmake/idf_as_lib
./build.sh
popd

mkdir ../esp32/esp-idf
cp -r examples/build_system/cmake/idf_as_lib ../esp32/esp-idf
cp -r components ../esp32/esp-idf
