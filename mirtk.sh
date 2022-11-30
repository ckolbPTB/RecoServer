#!/usr/bin/env bash
set -ev

# define apt-get installation command
APT_GET_INSTALL="apt-get install -yq --no-install-recommends"

${APT_GET_INSTALL} libtbb-dev libboost-all-dev libeigen3-dev libpng-dev

git clone https://github.com/BioMedIA/MIRTK.git --depth 1
cd MIRTK
mkdir build
cd build
cmake ..
make -j 20
make install