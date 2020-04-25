#!/usr/bin/env bash
set -v

# hstr
sudo dnf install hstr

# Increase the size of history maintained by bash -
# variables defined below increase the number of history items and history file size (default value is 500):
export HISTFILESIZE=10000
export HISTSIZE=${HISTFILESIZE}

# Ensure syncing (flushing and reloading) of .bash_history with in-memory history:
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"

# Force appending of in-memory history to .bash_history (instead of overwriting):
shopt -s histappend

# Use leading space to hide commands from history:
# Suitable for a sensitive information like passwords.
export HISTCONTROL=ignorespace

# the_silver_searcher
sudo dnf install the_silver_searcher

# htop
sudo dnf install htop

# tmux
sudo dnf install tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# aws
sudo pip3 install awscli

# tmate
sudo dnf install tmate


