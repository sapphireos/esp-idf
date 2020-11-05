#!/usr/bin/env bash

# the ESP-IDF needs to be checked out in chromatron/src/hal

./install.sh
. ./export.sh

pushd examples/build_system/cmake/idf_as_lib
./build.sh
popd

cp -r examples/build_system/cmake/idf_as_lib ../esp32/esp-idf
cp -r components ../esp32/components
