#!/usr/bin/env bash
ENV=$1

export ANSIBLE_HOST_KEY_CHECKING=False
INVENTORY=$(jarvis ec2 find -st running -n logstash-worker -an $ENV --ansible)
pushd ansible
ansible-playbook -i $INVENTORY restart_service.yml --become -K
popd
