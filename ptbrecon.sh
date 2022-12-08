#!/usr/bin/env bash
set -ev

conda update -n base -c defaults conda
conda env create --file ptbrecon_environment.yml
source /opt/conda/bin/activate PTBEnv
conda install ipykernel
conda install -y pytorch cudatoolkit -c pytorch
pip install pycuda scikit-cuda
pip install torchkbnufft