FROM rstudio/r-base:4.0-focal

RUN apt update -y
RUN apt install -y bowtie2
RUN apt install -y samtools
RUN apt install -y build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev

COPY . /tmp/

RUN R -e "install.packages('optparse', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('config', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('catools', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('BiocManager', repos='http://cran.us.r-project.org')"
RUN R -e "BiocManager::install()"

RUN R -e "BiocManager::install(c( 'GenomicRanges', 'ShortRead', 'GenomicAlignments', 'BSgenome'), update = TRUE, ask = FALSE)"

RUN R -e "install.packages('isotone', repos='http://cran.us.r-project.org')"

RUN R -e "install.packages('devtools', repos='http://cran.us.r-project.org') "

RUN Rscript /tmp/install_dependencies.R

CMD ["/bin/bash"]
