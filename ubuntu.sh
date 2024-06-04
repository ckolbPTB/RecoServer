#!/usr/bin/env bash
set -ev

# define apt-get installation command
APT_GET_INSTALL="apt-get install -yq --no-install-recommends"

# update, qq: quiet
apt-get update -qq
${APT_GET_INSTALL} apt-utils locales
locale-gen en_GB.UTF-8

export LANG=en_GB.UTF-8
export LANGUAGE=en_GB:en

# ensure certificates are up to date
${APT_GET_INSTALL} --reinstall ca-certificates

# base utilities
${APT_GET_INSTALL} build-essential python3-dev wget swig libomp-dev screen locate pkg-config curl git tmux zsh vim htop unzip

# ensure nvidia signing keys are up to date
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.0-1_all.deb
dpkg -i cuda-keyring_1.0-1_all.deb

# cmake
curl -o cmake.tgz -L https://github.com/Kitware/CMake/releases/download/v3.25.1/cmake-3.29.0-linux-x86_64.tar.gz
tar xzf cmake.tgz && rm cmake.tgz
ln -s cmake-*x86_64 cmake || true
export PATH="$PWD/cmake/bin:$PATH"

apt-get clean
