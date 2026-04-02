#!/bin/bash

LOG_FILE="/home/nidhi/unix_log_analyzer/server.log"

USER_NAME=$(whoami)

# Simulate random IP
IP_ADDRESS="192.168.1.$((RANDOM % 10 + 1))"

DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)

# Record LOGIN
echo "$DATE $TIME LOGIN $USER_NAME $IP_ADDRESS" >> "$LOG_FILE"

echo "Welcome $USER_NAME!"
echo "Your login has been recorded with IP: $IP_ADDRESS"

echo "Press ENTER to logout..."
read

# Capture logout time
LOGOUT_TIME=$(date +%H:%M:%S)

# Record LOGOUT
echo "$DATE $LOGOUT_TIME LOGOUT $USER_NAME $IP_ADDRESS" >> "$LOG_FILE"

echo "You have been logged out."
