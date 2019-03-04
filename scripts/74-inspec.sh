#!/usr/bin/env bash
set -ex

gem install inspec
inspec env | tr -d '\15\32' > /etc/profile.d/inspec.sh
gem install awspec
gem install test-kitchen
