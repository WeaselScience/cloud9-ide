This container spins up an instance of the [cloud9 ide](https://github.com/c9/core), prepared for development of nodejs applications.

The container provides no authentification to the ide, as this should be taken care of by other software, such as [oauth2_proxy](https://github.com/bitly/oauth2_proxy).

The ide runs on port 8080.

The container comes preinstalled with [nvm](https://github.com/creationix/nvm), which allows to easily adjust the version of nodejs when developing. By default, node ^7.0.0 is installed.

The environment is run as root, so the user in cloud9 will also be root.
