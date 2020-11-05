#!/usr/bin/env bash
./install.sh
. ./export.sh

pushd examples/build_system/cmake/idf_as_lib
./build.sh
idf.py menuconfig
popd