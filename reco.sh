#!/usr/bin/env bash
set -ev

# Create python 3.11 environment
conda update -n base -c conda-forge conda
conda init
conda create -n RecoEnv311 python=3.11
source /opt/conda/bin/activate RecoEnv311
conda install -y pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia

# Install mrpro
git clone https://github.com/PTB-MR/mrpro --depth 1 /opt/mrpro
cd /opt/mrpro/
pip install ".[lint,test,notebook]"

# Remove mrpro repo
rm -r /opt/mrpro