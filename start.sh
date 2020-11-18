#!/bin/bash

# if [[ -n $RCLONE_CONFIG_BASE64 ]]; then
# 	echo "Rclone config detected"
# 	echo "[DRIVE]" > rclone.conf
#     mkdir -p /app/.config/rclone
# 	echo "$(echo $RCLONE_CONFIG_BASE64|base64 -d)" >> /app/.config/rclone/rclone.conf
# fi



echo "STARTING RCLONE"
rclone serve webdav --user $USER --pass $PASS --addr 0.0.0.0:$PORT "$REMOTE"