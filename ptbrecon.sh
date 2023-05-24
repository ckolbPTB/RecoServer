#!/usr/bin/env bash
set -ev

conda update -n base -c defaults conda
conda env create --file ptbrecon_environment.yml
source /opt/conda/bin/activate PTBEnv
conda install ipykernel
conda install pytorch=2.0 torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
pip install pycuda==2022.2.2
pip install git+https://github.com/lebedov/scikit-cuda.git@2591b5670f07abe803887fe5e4d200f999762161
pip install torchkbnufft==1.4