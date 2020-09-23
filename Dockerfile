
## Based on https://github.com/getzlab/maf_pon_filter2/blob/master/maf_pon_filter2_task_1/Dockerfile
## TODO: There should a base image for matlab
FROM ubuntu:bionic

## Install Xvfb
RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        xvfb \
        xfonts-100dpi \
        xfonts-75dpi \
        xfonts-cyrillic \
        zip \
        unzip \
        libstdc++6 \
        xorg \
        xfonts-scalable \
        openbox \
        zlib1g-dev \
        wget \
        libncurses5 \
        libncurses5-dev \
        libncursesw5-dev \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /Matlab && cd /Matlab \
    && wget -nc https://ssd.mathworks.com/supportfiles/downloads/R2016a/deployment_files/R2016a/installers/glnxa64/MCR_R2016a_glnxa64_installer.zip \
    && unzip MCR_R2016a_glnxa64_installer.zip \
    && ./install -agreeToLicense yes -mode silent \
    && cd / && rm -rf Matlab

ENV LD_LIBRARY_PATH /usr/local/MATLAB/MATLAB_Runtime/v901/runtime/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v901/bin/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v901/sys/os/glnxa64:/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH}

COPY src /src
WORKDIR src

RUN chmod +x /src/tsv2mat /src/run_tsv2mat.sh; sync;

