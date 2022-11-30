#!/usr/bin/env bash
set -ev

# install ptbpyrecon
git clone https://github.com/ckolbPTB/PtbPyRecon.git 

cd PtbPyRecon

conda env create --file ptbrecon_environment.yml
source /opt/conda/bin/activate PTBEnv
conda install -y pytorch cudatoolkit -c pytorch
pip install pycuda scikit-cuda
pip install torchkbnufft
pip install --user -e . --install-option='--OpenMP'