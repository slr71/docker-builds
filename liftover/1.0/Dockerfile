FROM ubuntu:14.04
MAINTAINER Calvin McLean <calvinmclean@email.arizona.edu>

# Run updates
RUN sudo apt-get update && sudo apt-get upgrade -y

# Install tools
RUN sudo apt-get install -y wget

# Install dependencies
RUN sudo apt-get install -y libkrb5-3

# Download
RUN cd /usr/bin && wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/liftOver

# liftOver is prebuilt, so just make it executable
RUN chmod +x /usr/bin/liftOver

# Make data directory for volume mapping
RUN mkdir /data

ENTRYPOINT ["liftOver"]
# Usage: docker run -v $(pwd):/data -w /data liftover:v1.0 input.bed file.chain output.bed unlifted.bed
