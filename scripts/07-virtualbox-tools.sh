#!/usr/bin/env bash
set -ex

apt-get -y install linux-headers-$(uname -r) build-essential dkms

apt-get -y install dkms make

#wget http://download.virtualbox.org/virtualbox/4.3.8/VBoxGuestAdditions_4.3.8.iso
#sudo mkdir /media/VBoxGuestAdditions
#sudo mount -o loop,ro VBoxGuestAdditions_4.3.8.iso /media/VBoxGuestAdditions
#sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
#rm VBoxGuestAdditions_4.3.8.iso
#sudo umount /media/VBoxGuestAdditions
#sudo rmdir /media/VBoxGuestAdditions
#
#if [ ! -f /home/vagrant/VBoxGuestAdditions.iso ] ; then
#  echo "/home/vagrant/VBoxGuestAdditions.iso has not been uploaded as expected"
#  exit 1
#fi
#
#mount -o loop,ro /home/vagrant/VBoxGuestAdditions.iso /mnt/
#/mnt/VBoxLinuxAdditions.run || :
#umount /mnt/
#rm -f /home/vagrant/VBoxGuestAdditions.iso
#
#exit 0

sudo apt-get -y install virtualbox-guest-dkms
