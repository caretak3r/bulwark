#!/usr/bin/env bash
set -v

sudo dnf groupinstall 'Development Tools' ;
sudo dnf install epel-release ;
sudo dnf install curl file git docker jq nc;
export TERM=xterm

