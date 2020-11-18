#!/bin/bash

# Install rclone static binary
wget -q https://downloads.rclone.org/v1.52.3/rclone-v1.52.3-linux-amd64.zip
unzip -q rclone-v1.52.3-linux-amd64.zip
export PATH=$PWD/rclone-v1.52.3-linux-amd64:$PATH

echo "port is $PORT"

if [[ -n $RCLONE_CONFIG_BASE64 ]]; then
	echo "Rclone config detected"
	echo "[DRIVE]" > rclone.conf
    mkdir -p /app/.config/rclone
	echo "$(echo $RCLONE_CONFIG_BASE64|base64 -d)" >> /app/.config/rclone/rclone.conf
fi

if [[ -n $BOT_TOKEN && -n $OWNER_ID ]]; then
	echo "Bot token and owner ID detected"
	python3 config.py
fi

echo "SETUP COMPLETED"
