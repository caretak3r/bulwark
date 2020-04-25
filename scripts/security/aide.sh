#!/usr/bin/env bash
set -v

sudo dnf install aide

sudo aide --init
sudo cp -p /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
sudo aide --check && sudo aide --update
sudo cp -p /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
echo "00 01 * * * /usr/sbin/aide --check | mail -s 'Daily Check by AIDE' root" | sudo tee /etc/cron.d/aide-check