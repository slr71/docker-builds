FROM r-base:latest
MAINTAINER Upendra Devisetty <upendra@cyverse.org>
LABEL Description "This Dockerfile is for edgeR multifactorial"

# Run updates
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git
RUN apt-get install r-base-dev -y
RUN apt-get install libxml2 -y
RUN apt-get install libxml2-dev -y
RUN apt-get -y install libcurl4-gnutls-dev
RUN apt-get install -y libssl-dev

RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("edgeR");'
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("DESeq2");'
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("genefilter");'
RUN Rscript -e 'install.packages("devtools", dependencies = TRUE);'
RUN Rscript -e 'devtools::install_github("PF2-pasteur-fr/SARTools")'
RUN Rscript -e 'install.packages("getopt", dependencies = TRUE);'
RUN Rscript -e 'install.packages("knitr", dependencies = TRUE);'
RUN Rscript -e 'install.packages("RColorBrewer", dependencies = TRUE);'
RUN Rscript -e 'install.packages("pheatmap", dependencies = TRUE);'

# Add multiple custom functions for Pie_compare, Pie_plot and Bar_compare plots to the root paths
ADD *.R *.r *.rmd /

# change permissions to the wrapper script
ENV BINPATH /usr/bin
RUN chmod +x /run_deseq2_multi.r && cp /run_deseq2_multi.r $BINPATH

ENTRYPOINT ["run_deseq2_multi.r"]
CMD ["-h"]
