#!/usr/bin/env bash

set -x
apt-get install -y libreadline-dev

#git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
#git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
#echo 'export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
#echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
sudo groupadd rbenv
sudo usermod -aG rbenv ec2-user

# Install pre-requirements
yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel \
  make bzip2 autoconf automake libtool bison curl git-core

# Check if Git is installed
hash git 2>&- || {
  echo >&2 "Error: Git not found. Hint: Try installing the RPMForge or EPEL package repository.";
  exit 1;
}

# Check if /usr/local/rbenv already exists
if [[ -d "/usr/local/rbenv" ]]; then
  echo >&2  "Error: /usr/local/rbenv already exists. Aborting installation.";
  exit 1;
fi

# Install rbenv
git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv

# Check if clone succesful
if [ $? -gt 0 ]; then
  echo >&2  "Error: Git clone error! See above.";
  exit 1;
fi

# Add rbenv to the path
echo '# rbenv setup - only add RBENV PATH variables if no single user install found' > /etc/profile.d/rbenv.sh
echo 'if [[ ! -d "${HOME}/.rbenv" ]]; then' >> /etc/profile.d/rbenv.sh
echo '  export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
echo '  export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
echo '  eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
echo 'fi'  >> /etc/profile.d/rbenv.sh

chmod +x /etc/profile.d/rbenv.sh
export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
echo $PATH
eval "$(rbenv init -)"
source /etc/profile
source /etc/profile.d/rbenv.sh

mkdir -p /usr/local/rbenv/plugins
# Install ruby-build:
pushd /tmp
  rm -rf /tmp/ruby-build
  cd /usr/local/rbenv/plugins
  git clone https://github.com/rbenv/ruby-build.git

  # Check if clone succesful
  if [ $? -gt 0 ]; then
    echo >&2  "Error: Git clone error! See above.";
    exit 1;
  fi

  echo 'Listing /usr/local'
  ls -al /usr/local/

  echo 'Listing /usr/local/rbenv/'
  ls -al /usr/local/rbenv/

  echo 'Listing rbenv plugins'
  ls -al /usr/local/rbenv/plugins
  ls -al /usr/local/rbenv/plugins/ruby-build/
  cd /usr/local/rbenv/plugins/ruby-build/
  ./install.sh
popd

echo '---------------------------------'
echo '    rbenv installed system wide to /usr/local/rbenv'
echo '    Remember to restart your shell for the changes to take effect!'
echo '---------------------------------'

echo 'Initializing rbenv and installing ruby 2.5.1'
export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
#RUBY_CONFIGURE_OPTS=--disable-install-doc rbenv install 2.5.1
rbenv install 2.5.1
rbenv global 2.5.1
gem install bundler --no-ri --no-rdoc

ruby --version

echo "Installing gems for inspec testing"
gem install --no-rdoc rake rspec serverspec specinfra test-kitchen kitchen-ansible kitchen-inspec kitchen-sharedtests kitchen-sync kitchen-transport-rsync kitchen-docker

gem install --no-rdoc test-kitchen -v 1.0

gem install --no-rdoc kitchen-sharedtests -v 0.2.0

gem install inspec
inspec env | tr -d '\15\32' > /etc/profile.d/inspec.sh
gem install awspec