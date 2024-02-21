#!/usr/bin/env bash
set -ev

# Clone mrpro to get requirements
git clone https://github.com/PTB-MR/mrpro --depth 1 /opt/mrpro

# Create python 3.11 environment
conda update -n base -c conda-forge conda
conda init
conda create -n RecoEnv311 python=3.11
source /opt/conda/bin/activate RecoEnv311
pip install -r /opt/mrpro/binder/requirements.txt

# Remove mrpro repo
rm -r /opt/mrpro