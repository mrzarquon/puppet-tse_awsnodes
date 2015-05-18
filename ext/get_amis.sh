#!/bin/bash

#simple script to output common ami_ids we use for when we need to update params.pp


REGIONS=('us-west-2' 'ap-southeast-2' 'ap-southeast-1' 'eu-west-1')

for region in "${REGIONS[@]}"; do
  # ubuntu
  echo "getting ubuntu for ${region}"
  aws ec2 describe-images --owners 099720109477 --region $region --filters Name=virtualization-type,Values=hvm Name=state,Values=available Name=name,Values=*images/*ssd*trust*2015*,*images/*ssd*precise*2015* Name=root-device-type,Values='ebs' --query 'Images[*].{Name:Name,AMI:ImageId}' --output text | sort -k2 > $region.txt
  sleep 5
  # redhat
  echo "getting redhat for ${region}"
  aws ec2 describe-images --owners 309956199498 --region $region --filters Name=name,Values=*6*,*7* Name=virtualization-type,Values=hvm Name=state,Values=available --query 'Images[*].{Name:Name,AMI:ImageId}' --output text | sort -k2 >> $region.txt
  sleep 5
  # windows
  echo "getting windows for ${region}"
  aws ec2 describe-images --owners 801119661308 --region $region --filters Name=name,Values=*2012*English*Base*,*2008*R2*English*64Bit*Base* Name=virtualization-type,Values=hvm Name=state,Values=available --query 'Images[*].{Name:Name,AMI:ImageId}' --output text | sort -k2 >> $region.txt
  sleep 5
  # amazon
  echo "getting amazon for ${region}"
  aws ec2 describe-images --owners 137112412989 --region $region --filters Name=name,Values=*2015* Name=virtualization-type,Values=hvm Name=state,Values=available --query 'Images[*].{Name:Name,AMI:ImageId}' --output text | sort -k2 >> $region.txt
done <<< $REGIONS

