################# BASE IMAGE ######################
FROM continuumio/anaconda3:main

################## INSTALLATION ######################

RUN apt-get update && apt-get install -y build-essential && apt-get install -y wget git && apt-get clean && rm -rf /var/lib/apt/lists/*


WORKDIR /home
git clone https://github.com/ziyewang/COMEBin.git
WORKDIR /home/COMEBin
RUN conda env create -f comebin_env.yaml
RUN echo "conda activate comebin_env" >> ~/.bashrc
SHELL ["/bin/bash", "-c"]
WORKDIR /home/COMEBin
RUN chmod +x *.py && chmod +x *.sh
WORKDIR /home/COMEBin/scripts
RUN chmod +x *.py && chmod +x *.sh