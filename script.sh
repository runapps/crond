#!/bin/sh
current_time=`date '+%Y%m%d_%H%M%S'`

echo "$current_time"
mongodump --host ${MONGO_HOST} --port ${MONGO_PORT} -u ${MONGO_USER} -p ${MONGO_PASS} --authenticationDatabase ${MONGO_AUTH_DB} --db ${MONGO_DB} --gzip --archive > /root/dumptest.gz.archive.${current_time}
