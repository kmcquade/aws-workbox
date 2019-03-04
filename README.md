# aws-workbox

* Uses Packer to build a base Ubuntu 16.04 box with lots of nice AWS and DevOps-y tools.

# Usage

* Install Virtualbox
* Install Vagrant

Run the following:
```bash
vagrant init kmcquade/aws-workbox \
  --box-version 0.0.1
vagrant up
```

### Building from scratch

* Install Packer

Run the following:

```bash
packer build -on-error=ask ubuntu1604.json
```

Once that completes, run the following:

```bash
vagrant up
```

# Tools list

### AWS
* [awscli](https://github.com/aws/aws-cli)
* [saw](https://github.com/TylerBrock/saw)
* [chamber](https://github.com/segmentio/chamber)

### Infrastructure as Code
* [Packer](https://www.packer.io/)
* [Docker](https://docs.docker.com/get-started/)
* [Terraform](https://www.terraform.io/)
* [tfenv](https://github.com/tfutils/tfenv)

### Config Management
* [Ansible](https://docs.ansible.com/ansible/latest/index.html)

### Continuous Testing
* [inspec](https://www.inspec.io/)
* [serverspec](https://stelligent.com/2016/08/17/introduction-to-serverspec-what-is-serverspec-and-how-do-we-use-it-at-stelligent-part1/)

### Tweaks
* A few of Kinnaird's scripts
  * [Copying all SSM Parameters](https://gist.github.com/kmcquade/028fc845b30a4c2fd56603b103b0c142)
  * [Commands to export all AWS Profile keys](https://gist.github.com/kmcquade/d7d05513dbcc27bb1d9bb74d038a07d0)
  * [Get and Put KMS-encrypted secrets in S3 buckets](https://gist.github.com/kmcquade/91b6cc3cb143977bf4eea6ab234a1cdf)

### Other
* [rbenv](https://github.com/rbenv/rbenv)
* [jdk8](https://launchpad.net/~webupd8team/+archive/ubuntu/java)
* [gitcrypt](https://github.com/AGWA/git-crypt)
* VirtualBox Guest Additions


### Might add this later
* [prowler](https://github.com/toniblyx/prowler)
* [Scout Suite](https://github.com/nccgroup/ScoutSuite)
* [awslogs](https://github.com/jorgebastida/awslogs)

### Notes

##### Local .iso usage
I removed this from the original `iso_urls` line in the Packer JSON file. I can add it later.

        "iso/ubuntu-16.04.5-server-amd64.iso"


##### VagrantCloud in future

When I want to eventually push this to VagrantCloud, I should add this to Packer:

```
,
      {
        "type": "vagrant-cloud",
        "box_tag": "geerlingguy/ubuntu1604",
        "version": "{{user `version`}}"
      }
```

### References

Based on https://github.com/geerlingguy/packer-ubuntu-1604
Inspired by https://github.com/kief/infra-workbox