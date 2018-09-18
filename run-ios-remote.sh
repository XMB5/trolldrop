#!/bin/bash

if [ -z "$SSH_HOST" ]; then
    echo "SSH_HOST env var must be set"
    exit 1
fi

if [ -z "$SSH_PORT" ]; then
    SSH_PORT=22
fi

SSH_HOST_ROUTE=`route get "$SSH_HOST" | grep interface | cut -c 14-`
LOCAL_IP_ADDRESS=`ifconfig "$SSH_HOST_ROUTE" inet | grep inet | awk '{print $2}'`

python -mSimpleHTTPServer > /dev/null &
SERVER_PID=$!
ssh "root@$SSH_HOST" -p "$SSH_PORT" -t "wget http://$LOCAL_IP_ADDRESS:8000/trolldrop-ios -O trolldrop; chmod +x trolldrop; echo ===================================; ./trolldrop https://g.co/"
kill $SERVER_PID
