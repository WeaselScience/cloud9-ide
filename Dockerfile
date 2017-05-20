FROM ubuntu:16.04

# Make sure the OS is up to date
RUN apt-get update && apt-get upgrade -y

# Install most basic of things
RUN apt-get install -y build-essential git curl wget

# Install nvm - to be used by the end user if they need to fine tune their node version, since nvm will overwrite the nodejs version in interactive shell.
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

# Install and setup a sensible version of node for the end-user, using nvm
RUN bash -c "source /root/.nvm/nvm.sh && nvm install 7"
RUN bash -c "source /root/.nvm/nvm.sh && nvm alias default 7"

# Install nodejs globally for cloud9
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs

# Install cloud9
RUN apt-get install -y python2.7
RUN git clone git://github.com/c9/core.git /c9sdk && /c9sdk/scripts/install-sdk.sh

# Create workspace directory
RUN mkdir /root/workspace

# Copy the readme to workspace root
COPY ./README.md /root/workspace/README.md

EXPOSE 8080

# Run the entry script
ENTRYPOINT ["node", "/c9sdk/server.js"]
CMD ["-w", "/root/workspace", "--port", "8080", "--packed", "--collab", "--listen", "0.0.0.0", "-a", ":"]
