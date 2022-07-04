FROM gitpod/workspace-full

RUN brew install R

RUN sudo apt install bowtie2