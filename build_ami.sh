#!/bin/bash
# Packer build script to install Docker and Docker-Compose

apt-get update
apt-get install -y apt-transport-https ca-certificates git unzip
apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list

apt-get update
apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
apt-get install -y docker-engine
curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#### Sanatize AMI ####
rm -rf /var/lib/cloud/instances/
rm -rf /var/log/messages /var/log/cloud* /var/log/audit/* /var/log/maillog /var/log/cron /var/log/messages-*
