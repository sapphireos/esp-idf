#!/usr/bin/env bash

# the ESP-IDF needs to be checked out in chromatron/src/hal
# don't forget to setup submodules!
# git submodule init
# git submodule update

set -e

# run from the IDF tree regardless of where we were invoked from: the
# setup script and every path below (including IDF_TOOLS_PATH, derived
# from $PWD) are relative to this file, not to the caller's cwd
cd "$(dirname "${BASH_SOURCE[0]}")"

# keep IDF's toolchains + python env local to this tree (build tooling
# should not live in $HOME); override with your own IDF_TOOLS_PATH to
# reuse an existing install and skip the one-time toolchain downloads
export IDF_TOOLS_PATH="${IDF_TOOLS_PATH:-$PWD/.idf-tools}"

# installs toolchains, creates the venv from the vendored wheel cache
# (idf_python_wheels/), and sources export.sh — see that file for why
source ./chromatron_setup_idf_env.sh

# pushd examples/build_system/cmake/idf_as_lib
pushd chromatron_lib
./build-esp32.sh
popd

# idempotent copy: the original `mkdir ../esp32/esp-idf` failed when the
# tree already existed, and the following `cp -r chromatron_lib` then landed
# inside .../esp-idf/chromatron_lib instead of refreshing idf_as_lib.
mkdir -p ../esp32/esp-idf/idf_as_lib
cp -a chromatron_lib/. ../esp32/esp-idf/idf_as_lib/
cp -a components ../esp32/esp-idf/
cp esp32_chromatron.ld ../esp32/esp-idf/idf_as_lib/build
