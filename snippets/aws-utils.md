# Setting a particular version of the lib aws-utils for testing purposes on your local jarvis installation

### Use it on the aws-resource-finder/cli dir

### For Linux
```bash
export AWSUTILSBRANCH="feature|fix/AWSUTILSBRANCH" && AWSUTILSBRANCH=$(echo $AWSUTILSBRANCH | sed 's/[/-]/\\&/g')&& python3 -m venv  venv && source venv/bin/activate && sed -i s/"$(grep ipsy-aws requirements.txt | sed -e 's/.*git@\(.*\)#egg=ipsy-aws.*/\1/')"/"${AWSUTILSBRANCH}"/g requirements.txt && pip install -r requirements.txt && echo "Now call jarvis from here"
```

### On macOs you will need to install gsed for this to work.
```
brew install gnu-sed
```
### For macOs
```bash
export AWSUTILSBRANCH="feature|fix/AWSUTILSBRANCH" && AWSUTILSBRANCH=$(echo $AWSUTILSBRANCH | sed 's/[/-]/\\&/g')&& python3 -m venv  venv && source venv/bin/activate && gsed -i s/"$(grep ipsy-aws requirements.txt | gsed -e 's/.*git@\(.*\)#egg=ipsy-aws.*/\1/')"/"${AWSUTILSBRANCH}"/g requirements.txt && pip install -r requirements.txt && echo "Now call jarvis from here"
```

### Clean things ( optional )
```bash
unset AWSUTILSBRANCH && deactivate && rm -rf venv
```
