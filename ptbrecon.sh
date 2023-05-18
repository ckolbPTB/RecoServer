#!/usr/bin/env bash
set -ev

conda update -n base -c defaults conda
conda env create --file ptbrecon_environment.yml
source /opt/conda/bin/activate PTBEnv
conda install ipykernel
conda install -y pytorch=2.0 cudatoolkit -c pytorch
conda install pycuda
pip install git+https://github.com/lebedov/scikit-cuda.git@2591b56
pip install torchkbnufft=1.4