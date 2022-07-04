FROM gitpod/workspace-full

RUN brew install R

RUN apt install bowtie2