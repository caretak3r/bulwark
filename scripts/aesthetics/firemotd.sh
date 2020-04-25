#!/usr/bin/env bash
set -v

# Get deps and install FireMotD
sudo dnf install bc sysstat jq moreutils
curl -s https://raw.githubusercontent.com/OutsideIT/FireMotD/master/FireMotD -o /usr/local/bin/FireMotD \
  && chmod 755 /usr/local/bin/FireMotD