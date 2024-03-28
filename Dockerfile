FROM nvcr.io/nvidia/cuda:11.6.2-cudnn8-runtime-ubuntu20.04


RUN apt-get -q update \ 
  && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
  git \
  python3.9 \
  python3-pip \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get autoremove -y \
  && apt-get clean \
  && pip install -q --no-cache-dir \
  torch \
  numpy

COPY . /app/OmegaFold
WORKDIR /app/OmegaFold
RUN pip3 install .
