#!/usr/bin/env bash
TERRAIN=$1
read -s -p "Enter SSH Password: " ANSIBLE_PASSWORD
echo checking instances on $TERRAIN
export ANSIBLE_HOST_KEY_CHECKING=False
for account in $(jarvis account find -f data.terrain=$TERRAIN -o id -h)
do
  echo Processing $account
  INVENTORY=$(jarvis ec2 find -st running -a $account --ansible|grep -v found)
  if [[ -z $INVENTORY ]]; then
    echo "No running instances found for $account"
    continue
  else
    ansible-playbook -i $INVENTORY ./ansible/reset_clamav.yml --become --extra-vars "ansible_sudo_pass=$ANSIBLE_PASSWORD"
  fi
done

