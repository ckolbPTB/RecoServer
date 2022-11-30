#!/usr/bin/env bash
set -ev

# define apt-get installation command
APT_GET_INSTALL="apt-get install -yq --no-install-recommends"

${APT_GET_INSTALL} libpng-dev

git clone https://github.com/KCL-BMEIS/niftyreg.git --depth 1
cd niftyreg
mkdir build
cd build
cmake ..
make -j 20
make install


