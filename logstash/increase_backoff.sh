#!/usr/bin/env bash
ENV=$1

pushd ansible
export ANSIBLE_HOST_KEY_CHECKING=False
INVENTORY=$(jarvis ec2 find -st running -n logstash-worker -an $ENV --ansible)
ansible-playbook -i $INVENTORY increase_backoff.yml --become -K
popd
