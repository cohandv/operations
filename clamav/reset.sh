#!/usr/bin/env bash
TERRAIN=$1
echo Checking instances on $TERRAIN
export ANSIBLE_HOST_KEY_CHECKING=False
INVENTORY=""
for account in $(jarvis account find -f data.terrain=$TERRAIN -o id -h)
do
  echo Processing $account
  INVENTORY="$INVENTORY,$(jarvis ec2 find -st running -a $account --ansible|grep -v found)"
done

if [[ -z INVENTORY ]]; then
  echo "No running instances found for $account"
  continue
else
  echo Running ansible on the inventory
  read -s -p "Enter SSH Password: " ANSIBLE_PASSWORD
  ansible-playbook -i $INVENTORY ./ansible/reset_clamav.yml --become --extra-vars "ansible_sudo_pass=$ANSIBLE_PASSWORD"
fi

