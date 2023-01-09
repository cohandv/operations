#!/usr/bin/env bash
TERRAIN=$1

pushd ansible
export ANSIBLE_HOST_KEY_CHECKING=False
INVENTORY=$(jarvis ec2 find -st running -t $TERRAIN --ansible)
ansible-playbook -i $INVENTORY check.yml --become -K
popd
