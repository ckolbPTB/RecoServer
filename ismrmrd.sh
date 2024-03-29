#!/usr/bin/env bash
set -ev

# define apt-get installation command
APT_GET_INSTALL="apt-get install -yq --no-install-recommends"

# ismrmrd + siemens_to_ismrmrd
${APT_GET_INSTALL} g++ cmake
${APT_GET_INSTALL} libboost-all-dev xsdcxx libxerces-c-dev \
    libhdf5-serial-dev h5utils hdf5-tools libtinyxml-dev libxml2-dev libxslt1-dev libpugixml-dev

git clone https://github.com/ismrmrd/ismrmrd.git --depth 1 --branch ${ISMRMRD_TAG}

cd ismrmrd
mkdir build
cd build
cmake ..
make -j 20
make install

git clone https://github.com/ismrmrd/siemens_to_ismrmrd.git --depth 1 --branch ${SIEMENS_TO_ISMRMRD_TAG}
cd siemens_to_ismrmrd
mkdir build
cd build
cmake ..
make -j 20
make install

apt-get clean
