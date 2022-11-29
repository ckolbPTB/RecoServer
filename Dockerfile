ARG BASE_IMAGE=nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04
FROM ${BASE_IMAGE} as base

ENV http_proxy "http://webproxy.berlin.ptb.de:8080"
ENV https_proxy "http://webproxy.berlin.ptb.de:8080"

ARG DEBIAN_FRONTEND=noninteractive

# update nvidia keys
#RUN apt-get install -yq --no-install-recommends wget
#RUN apt-key del 7fa2af80
#RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.0-1_all.deb
#RUN dpkg -i cuda-keyring_1.0-1_all.deb

# install ubuntu dependencies
COPY ubuntu.sh .
RUN bash ubuntu.sh
RUN rm ubuntu.sh

# install ismrmrd
COPY ismrmrd.sh .
RUN bash ismrmrd.sh
RUN rm ismrmrd.sh
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# install anaconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

# install niftyreg
COPY niftyreg.sh .
RUN bash niftyreg.sh
RUN rm niftyreg.sh

# install mirtk
COPY mirtk.sh .
RUN bash mirtk.sh
RUN rm mirtk.sh

# copy data and recon code
COPY ptb_rec_data/ ./ptb_rec_data
COPY PtbPyRecon/ ./PtbPyRecon

# install ptbpyrecon
COPY ptbrecon.sh .
RUN bash ptbrecon.sh
RUN rm ptbrecon.sh

# prep ptbpyrecon test
COPY ptbrecon_test.par .

# verify reconstruction on startup
#ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "PtbEnv", "python", "/PtbPyRecon/TestScripts/TEST.py"]
