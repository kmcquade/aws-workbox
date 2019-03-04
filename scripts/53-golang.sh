#!/usr/bin/env bash
set -ex

sudo apt-get install -y golang-go
export GOPATH=$HOME/go
echo 'export GOPATH="$HOME/go"' >> /home/vagrant/.bash_profile
echo "PATH=$PATH:$GOPATH/bin # Add GOPATH/bin to PATH for scripting" >> /home/vagrant/.bash_profile
source /home/vagrant/.bash_profile