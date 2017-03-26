FROM weaselscience/ubuntu-nvm:latest

# Install and setup a sensible version of node, and install a version to run cloud9 with
RUN nvm install 7 
RUN nvm install 0.12 
RUN nvm alias default 7

# Install cloud9
RUN apt-get install -y python2.7
RUN git clone git://github.com/c9/core.git /c9sdk && /c9sdk/scripts/install-sdk.sh

# Create workspace directory
RUN mkdir /workspace

# Run the entry script
ENTRYPOINT node entrypoint.js
