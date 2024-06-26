ARG BASE_IMAGE=nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04
FROM ${BASE_IMAGE} as base

ENV http_proxy "http://webproxy.berlin.ptb.de:8080"
ENV https_proxy "http://webproxy.berlin.ptb.de:8080"

ARG DEBIAN_FRONTEND=noninteractive

# set versions
ARG ISMRMRD_TAG="v1.13.7"
ARG SIEMENS_TO_ISMRMRD_TAG="v1.2.11"

# install ubuntu dependencies
COPY ubuntu.sh .
RUN bash ubuntu.sh
RUN rm ubuntu.sh

# install ismrmrd
COPY ismrmrd.sh .
RUN bash ismrmrd.sh
RUN rm ismrmrd.sh
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

# install python dependencies
COPY reco.sh .
RUN bash reco.sh
RUN rm reco.sh

# install niftyreg
COPY niftyreg.sh .
RUN bash niftyreg.sh
RUN rm niftyreg.sh

# install mirtk
COPY mirtk.sh .
RUN bash mirtk.sh
RUN rm mirtk.sh



