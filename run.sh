#!/bin/bash

sudo rm -rf .terraform/ terraform.tfstate terraform.tfstate.backup .terraform.lock.hcl
/usr/local/bin/terraform init

/usr/local/bin/terraform apply --auto-approve

sudo echo "deploy_user ansible_host=`terraform output -raw publicIP` ansible_ssh_pass=\"`terraform output -raw password`\" ansible_user=root ansible_port=22" > ./ansible_adduser/iplist.txt
sudo ansible-playbook -i ./ansible_adduser/iplist.txt ./ansible_adduser/main.yml
