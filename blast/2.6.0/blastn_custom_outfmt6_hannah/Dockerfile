FROM debian:wheezy
MAINTAINER Upendra Devisetty <upendra@cyverse.org>
LABEL Description "This Dockerfile is for blast-2.6.0"

RUN apt-get update && apt-get install -y --no-install-recommends \
		wget \
		python-minimal=2.7.3-4+deb7u1 \
	&& rm -rf /var/lib/apt/lists/*

# Download & install BLAST
RUN mkdir /opt/blast
WORKDIR /opt/blast
RUN wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.6.0+-x64-linux.tar.gz
RUN tar -zxvf /opt/blast/ncbi-blast-2.6.0+-x64-linux.tar.gz
ENV PATH /opt/blast/ncbi-blast-2.6.0+/bin/:$PATH
WORKDIR /

# Add wrapper script
ADD blastn_wrapper_custom_outfmt6_hannah.sh /usr/bin
RUN chmod +x /usr/bin/blastn_wrapper_custom_outfmt6_hannah.sh

# Entrypoint
ENTRYPOINT ["blastn_wrapper_custom_outfmt6_hannah.sh"]
