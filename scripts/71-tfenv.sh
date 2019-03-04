#!/usr/bin/env bash
set -ex

git clone https://github.com/tfutils/tfenv.git /home/vagrant/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> /home/vagrant/.bash_profile
# TODO: Figure out how to add this to the path in the bash script. Otherwise tfenv install doesn't work because it can't run terraform --version
export PATH="$HOME/.tfenv/bin:$PATH"
/home/vagrant/.tfenv/bin/tfenv install ${TERRAFORM_VERSION}
