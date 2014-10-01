Development environment with [Vagrant](http://www.vagrantup.com/) and provisioned by [SaltStack](http://saltstack.com/)

## Requirements

Install [Vagrant](http://docs.vagrantup.com/v2/installation/) which requires [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

Since 1.3, Vagrant has had native Salt support.

## Provisioning

To provision clone this repo and run `$ vagrant up` in the same directory.

Salt will install the most current versions of GIT, MySQL, Node.js, Gulp, and Loopback as well as attempt to install application specific NPM packages. Vagrant
will open up port 8080 and 5858
