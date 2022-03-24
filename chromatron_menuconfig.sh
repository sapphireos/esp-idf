#!/usr/bin/env bash
./install.sh
. ./export.sh

pushd examples/build_system/cmake/idf_as_lib
cmake -B build -DCMAKE_TOOLCHAIN_FILE=$IDF_PATH/tools/cmake/toolchain-esp32.cmake -DTARGET=esp32 -G "Unix Makefiles"
make -C build menuconfig
popd