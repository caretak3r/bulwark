#!/bin/sh
# remember to:
# 1. add ForceCommand /etc/slack/notify.sh to /etc/ssh/sshd_config
url="$SLACK_WEBHOOK_URL"
channel="#cloudslack"
host="`hostname`"
content="\"attachments\": [ { \"mrkdwn_in\": [\"text\", \"fallback\"], \"fallback\": \"SSH login: $USER connected to \`$host\`\", \"text\": \"SSH login to \`$host\`\", \"fields\": [ { \"title\": \"User\", \"value\": \"$USER\", \"short\": true }, { \"title\": \"IP Address\", \"value\": \"$SSH_CLIENT\", \"short\": true } ], \"color\": \"#F35A00\" } ]"
curl -s -X POST --data-urlencode "payload={\"channel\": \"$channel\", \"mrkdwn\": true, \"username\": \"ssh-bot\", $content, \"icon_emoji\": \":computer:\"}" $url
/bin/bash
