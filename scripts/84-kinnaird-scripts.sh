#!/usr/bin/env bash
set -ex

# Download all this stuff with `wget <url> -P /home/vagrant/.aws`

# get_aws_profile_keys.py
wget https://gist.githubusercontent.com/kmcquade/d7d05513dbcc27bb1d9bb74d038a07d0/raw/f46f4c42ece4750a2fabb63939d000e8784d0734/get_aws_profile_keys.py -P /home/vagrant/.aws
chmod +x /home/vagrant/.aws/get_aws_profile_keys.py

# copy-ssm-parameters.py
wget https://gist.githubusercontent.com/kmcquade/028fc845b30a4c2fd56603b103b0c142/raw/d93545b2fe03c0c19a409a0906cfc32bf91af6cc/copy-ssm-parameters -O ~/.aws/copy-ssm-parameters.py
chmod +x /home/vagrant/.aws/copy-ssm-parameters.py

# aws-secrets-get.sh
wget https://gist.githubusercontent.com/kmcquade/91b6cc3cb143977bf4eea6ab234a1cdf/raw/2734626bc558bd7f3bae30745493ce77d5dc77ae/aws-secrets-get.sh -P /home/vagrant/.aws
chmod +x /home/vagrant/.aws/aws-secrets-get.sh

# aws-secrets-send.sh
wget https://gist.githubusercontent.com/kmcquade/91b6cc3cb143977bf4eea6ab234a1cdf/raw/2734626bc558bd7f3bae30745493ce77d5dc77ae/aws-secrets-send.sh -P /home/vagrant/.aws
chmod +x /home/vagrant/.aws/aws-secrets-send.sh
