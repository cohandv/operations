### How to use

This is an small scripts that helps you to manipulate jira tickets from inside the repository as long as you follow branch naming convention.

### Naming convention
We should have 3 types of branches:
- master / develop / stable: reserved names for stable branches (plugin wont work on these branches)
- feature/JIRAID-1234: this is a feature branch
- fix/JIRAID-1234: this is a fix branch

### Dependencies
- npm (or any other alternative)
- jira-cli (https://github.com/palashkulsh/jira-cmd)


### Installation
Place this script into an executable path (either by using a sumlink  or adding this path to PATH env var)

```
ln -sf ~/src/operations/jira/js /usr/local/bin/js
```

Alternativately I suggest to copy the jira.sh into the zsh plugin dir to have some other aliases. In this example I have oh-my-zsh installed so there is were this script will be placed:

```
/Users/davidcohan/.oh-my-zsh/custom
```
