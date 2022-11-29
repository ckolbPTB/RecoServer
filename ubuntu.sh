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

# base utilities
${APT_GET_INSTALL} build-essential wget swig libomp-dev screen

# git
${APT_GET_INSTALL} git

apt-get clean
