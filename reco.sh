#!/usr/bin/env bash
set -ev

conda update -n base -c defaults conda
conda env create --file reco_environment.yml
source /opt/conda/bin/activate RecoEnv311
conda install pytorch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 pytorch-cuda=12.1 -c pytorch -c nvidia
pip install torchkbnufft==1.4