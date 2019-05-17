#!/bin/sh

script_file=${SCRIPT_FILE:-/script.sh}
cron_arg=${CRON_ARG:-* * * * *}

echo "CRON_ARG: $cron_arg, SCRIPT_FILE: $script_file"
echo "$cron_arg $script_file" | crontab - && crond -f -L /dev/stdout
