## Introduction

My home directory is a git repository. You're looking at it.

## Installation

```bash
$ git init
$ git remote add origin git@github.com:iamvery/dotfiles.git
$ git submodule init
$ git submodule update
```

## Updating

```bash
$ git pull
$ git submodule foreach git pull origin master
```
