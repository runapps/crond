#!/bin/sh
set -e
current_time=`date '+%Y%m%d_%H%M%S'`

echo "{{MONGO_HOST}}:{{MONGO_PORT}} - ${current_time}"
mongodump --host {{MONGO_HOST}} --port {{MONGO_PORT}} -u {{MONGO_USER}} -p {{MONGO_PASS}} --authenticationDatabase {{MONGO_AUTH_DB}} --db {{MONGO_DB}} --gzip --archive > /root/{{FILE_PREFIX}}.{{FILE_EXT}}.${current_time}
