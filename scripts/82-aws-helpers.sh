#!/usr/bin/env bash
set -ex

# Install aws-mfa
pip install aws-mfa

# Install saw for cloudwatch logging
### https://github.com/TylerBrock/saw
wget https://github.com/TylerBrock/saw/releases/download/v${SAW_VERSION}/saw_${SAW_VERSION}_linux_amd64.deb -P /tmp
sudo dpkg -i /tmp/saw_*

cat > /home/vagrant/.aws/credentials <<ENDCREDENTIALS
[default-long-term]
region = us-east-1
aws_access_key_id = YOUR_LONGTERM_KEY_ID
aws_secret_access_key = YOUR_LONGTERM_ACCESS_KEY
aws_mfa_device = arn:aws:iam::123456788990:mfa/youriamusername

[default]
aws_access_key_id = <POPULATED_BY_AWS-MFA>
aws_secret_access_key = <POPULATED_BY_AWS-MFA>
aws_security_token = <POPULATED_BY_AWS-MFA>
ENDCREDENTIALS