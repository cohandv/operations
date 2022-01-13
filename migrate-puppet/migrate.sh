#!/usr/bin/env bash
ENV=$1

pushd ansible
export ANSIBLE_HOST_KEY_CHECKING=False
INVENTORY=$(jarvis ec2 find -st running -a $ENV --ansible)
ansible-playbook -i $INVENTORY update_puppet.yml --become -K
popd
