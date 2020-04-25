#!/usr/bin/env bash
set -v

# Download the checksum
curl https://get.gravitational.com/teleport-4.2.1-1.x86_64.rpm.sha256 -O /tmp/teleport-4.2.1-1.x86_64.rpm.sha256

# <checksum> <filename>
curl https://get.gravitational.com/teleport-4.2.1-1.x86_64.rpm -O /tmp/teleport-4.2.1-1.x86_64.rpm
sha256sum /tmp/teleport-4.2.1-1.x86_64.rpm

# Verify that the checksums match
sudo rpm -i /tmp/teleport-4.2.1-1.x86_64.rpm

# Find teleport
which teleport

# Once the s3 bucket has been mounted with goofys,
# create a data directory for teleport.
# mkdir -p /mnt/s3/teleport/data

# alternatively, somewhere local
mkdir -p /var/lib/teleport

# create a systemd service script
# This will run auth,node,proxy on a single-node
# and other nodes will be manually added.
cat <<EOF | sudo tee /lib/system/systemd/teleport.service
[Unit]
Description=Teleport Auth Service
After=network.target

[Service]
Type=simple
Restart=on-failure
# Set the nodes roles with the `--roles`
# In most production environments you will not
# want to run all three roles on a single host
# --roles='proxy,auth,node' is the default value
# if none is set

ExecStart=/usr/local/bin/teleport start --roles='proxy,auth,node' --config=/etc/teleport.yaml --diag-addr=127.0.0.1:3434 --pid-file=/var/run/teleport.pid
ExecReload=/bin/kill -HUP $MAINPID
PIDFile=/var/run/teleport.pid

[Install]
WantedBy=multi-user.target
EOF
