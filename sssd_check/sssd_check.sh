#!/usr/bin/env bash
ACCOUNTID=$1

pushd ansible
export ANSIBLE_HOST_KEY_CHECKING=False
INVENTORY=$(jarvis ec2 find -st running -a $ACCOUNTID --ansible)
ansible-playbook -i $INVENTORY sssd_check.yaml -u ****  --ask-pass  -K
popd
