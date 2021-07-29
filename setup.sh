#!/bin/bash

apk update && apk add openssh-client bash
mkdir -p ~/.ssh
eval $(ssh-agent -s)
echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
touch ~/.ssh/config
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
ssh-keyscan -H $EC2_IP_PUBLIC >> ~/.ssh/known_hosts
ssh ec2-user@$EC2_IP_PUBLIC 'sudo yum update -y; sudo yum install -y docker; sudo usermod -aG docker ec2-user'