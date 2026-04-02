#!/bin/bash

LOGFILE="system.log"

while true
do
    DATE=$(date "+%Y-%m-%d %H:%M:%S")

    IP="192.168.1.$((RANDOM % 10 + 1))"

    LEVELS=("INFO" "ERROR" "WARNING")
    LEVEL=${LEVELS[$RANDOM % 3]}

    if [ "$LEVEL" = "INFO" ]; then
        MESSAGE="User logged in from $IP"
    elif [ "$LEVEL" = "ERROR" ]; then
        MESSAGE="Login failed from $IP"
    else
        MESSAGE="High memory usage from $IP"
    fi

    echo "$DATE $LEVEL $MESSAGE" >> $LOGFILE


    echo "Log generated at $DATE"

    sleep 5
done

