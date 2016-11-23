#!/bin/bash

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates git unzip
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list

sudo apt-get update
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install -y docker-engine

#### Sanatize AMI ####
rm -rf /var/lib/cloud/instances/
rm -rf /var/log/messages /var/log/cloud* /var/log/audit/* /var/log/maillog /var/log/cron /var/log/messages-*
