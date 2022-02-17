This script was created to generate a new tag `account:purpose` for all our accounts, and can be extended or modified to create new ones in the future

1. Add setnewtag with execute permissions on your `$PATH`

2. excecute from `cloud-accounts/terraform/terrains`  this way:
```
find */account/* -type f -name "account-*.tf" -exec setnewtag {} \;
```
