#!/usr/bin/env bash
set -v

# Install deps for goofys
sudo dnf install fuse-utils

# Get the goofys pre-built binary
curl -s https://github.com/kahing/goofys/releases/latest/download/goofys -o /usr/local/bin/goofys && \
  chmod +x /usr/local/bin/goofys

# Add the fstab entry
mkdir -p /mnt/s3
echo "goofys#bucket /mnt/s3 fuse  _netdev,allow_other,nonempty,--file-mode=0666,--dir-mode=0777,--region=us-east-1,--profile=goofys  0 0" >> /etc/fstab

# try to remount all your fuse fstab entries without requiring a reboot
sudo umount -a -t fuse && mount -a -t fuse

# put this into a crontab to periodically ensure goofys is mounting the s3 bucket
cat <<EOF > /etc/cron.d/automount-s3
mkdir -p /mnt/s3
fusermount -u /mnt/s3
EOF
