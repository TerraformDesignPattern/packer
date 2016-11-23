#!/bin/bash  -x
# This script uses Packer to build new AMIs. 
# It will also update the Terraform's variables.tf with the new AMI ID.

BUILD_NUMBER="2"
LOG_FILE="packer-output.log"
REGIONS="us-east-1"

packer build -var "BUILD_NUMBER=${BUILD_NUMBER}" -var "REGIONS=${REGIONS}" ami.json | tee ${LOG_FILE}

## Update Terraform AMI module
[  -f "${LOG_FILE}" ] || { echo "'${LOG_FILE}' is either empty or does not exist, not updating the AMI's Terraform variables" && exit 1; }

for REGION in $REGIONS; do
  IMAGE_ID=$(cat ${LOG_FILE} | grep ${REGION}: | awk '{ FS = ": " ; print $NF}')

  if [ ! -z "${IMAGE_ID}" ]; then
    echo ${IMAGE_ID}
    sed -ri "s/${REGION}.*/${REGION} = \"${IMAGE_ID}\"/g" ./terraform-ami-module/docker.tf
  fi

done
