#!/usr/bin/env bash
set -v

# linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r /etc/skel/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> /etc/skel/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> /etc/skel/.bash_profile