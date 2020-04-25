#!/bin/bash
set -v
# syntax: [""]=""
declare -A users=(
    ["testuser"]="ssh-rsa 123~"
)

for user in "${!users[@]}"; do
    if ! id -u "$user" >/dev/null 2>&1; then
        echo "$user doesn't exist, creating user..."
        useradd -m "$user" -s /bin/bash;
        echo "adding user to wheel..."
        usermod -a -G wheel "$user";
        echo "disabling user password expiration..."
        chage -I -1 -m 0 -M 99999 -E -1 "$user"
        echo "ensuring wheel conf exists in /etc/sudoers"
        echo '%wheel        ALL=(ALL)       NOPASSWD: ALL' > /etc/sudoers.d/00-caretakers-wheel-users
        cat /etc/sudoers.d/00-caretakers-wheel-users
        # add the ssh public key
        su - "$user" -c "umask 022 ; mkdir .ssh ; echo ${users[$user]} >> .ssh/authorized_keys" && exit;
    else
        echo "$user already exists"
    fi
done
