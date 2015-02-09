# ~/ :dizzy:

My home directory is a git repository. You're looking at it. This complicates installation just a bit because you can't simply clone the repository as your home directly likely already exists. For that reason, you must init an empty repo, add the remote, and pull down all the goodness. Enjoy!

## Installation

```bash
$ git init
$ git remote add origin git@github.com:iamvery/dotfiles.git
$ git pull origin master
$ git submodule init
$ git submodule update
```

## Updating

```bash
$ git pull
$ git submodule foreach git pull origin master
```
