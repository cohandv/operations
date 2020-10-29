#!/usr/bin/env bash
LIST=$1

pushd ansible
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i $LIST undo_drop_access.yml --become -K
popd