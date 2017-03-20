FROM ubuntu:16.04

# Make sure the OS is up to date
RUN apt-get update && apt-get upgrade -y

# Make sure general dependencies are installed
RUN apt-get install -y git curl wget

# Install nvm
RUN apt-get install -y build-essential
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

# Install and setup a sensible version of node, and install a version to run cloud9 with
RUN /root/.nvm/nvm.sh install 7 
RUN /root/.nvm/nvm.sh install 0.12 
RUN /root/.nvm/nvm.sh alias default 7

# Install cloud9
RUN git clone git://github.com/c9/core.git /c9sdk && /c9sdk/scripts/install-sdk.sh

# Create workspace directory
RUN mkdir -p ~/workspace

# Run the entry script
ENTRYPOINT node entrypoint.js
