#!/usr/bin/env bash

if [ "$#" -lt 2 ]; then
    echo "Help"
    echo "Run this command with an specific terraform module that you want to run, putting the token ACCOUNT where you need te script to replace files"
    echo "  ${0} [apply|plan] module.account-ACCOUNT-global.module.dms"
    echo ""
    echo "Extra arguments can be any other terraform argument (operation has to be defined in this case)"
    echo "  ${0} apply module.account-ACCOUNT-global.module.dms --auto-approve"
    echo ""
    exit 1
fi

operation=$1
shift
module=$1
shift
arguments=$@
accounts=$(jarvis account find -o name -h|awk '{print $1}'|sort|uniq)
cmd="terraform ${operation} "
for account in $accounts; do
  target=$(echo $module | sed "s/ACCOUNT/$account/")
  cmd+="--target ${target} "
done
cmd+=$arguments
echo $cmd
