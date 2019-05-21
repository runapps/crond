#!/bin/sh
set -e
current_time=`date '+%Y%m%d_%H%M%S'`
retention=${FILE_RETENTION}
tailnum=$((retention + 1))

echo "${MONGO_HOST}:${MONGO_PORT} - ${current_time}"
mongodump --host ${MONGO_HOST} --port ${MONGO_PORT} -u ${MONGO_USER} -p ${MONGO_PASS} --authenticationDatabase ${MONGO_AUTH_DB} --db ${MONGO_DB} --gzip --archive > /root/${FILE_PREFIX}.${FILE_EXT}.${current_time}

find . -name '/root/${FILE_PREFIX}.${FILE_EXT}.*' -type f | sort -r | tail -n +${tailnum} | xargs -i echo "rm -rf {}"
find . -name '/root/${FILE_PREFIX}.${FILE_EXT}.*' -type f | sort -r | tail -n +${tailnum} | xargs rm -rf
