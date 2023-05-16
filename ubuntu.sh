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
${APT_GET_INSTALL} build-essential python3-dev wget swig libomp-dev screen locate pkg-config curl

# CMake
curl -o cmake.tgz -L https://github.com/Kitware/CMake/releases/download/v3.25.1/cmake-3.25.1-linux-x86_64.tar.gz
tar xzf cmake.tgz && rm cmake.tgz
ln -s cmake-*x86_64 cmake || true
export PATH="$PWD/cmake/bin:$PATH"

# git
${APT_GET_INSTALL} git

apt-get clean
