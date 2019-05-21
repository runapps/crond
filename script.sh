#!/bin/sh
set -e
current_time=`date '+%Y%m%d_%H%M%S'`
retention=${FILE_RETENTION}
tailnum=$((retention + 1))

echo "${MONGO_HOST}:${MONGO_PORT} - ${current_time}"
mongodump --host ${MONGO_HOST} --port ${MONGO_PORT} -u ${MONGO_USER} -p ${MONGO_PASS} --authenticationDatabase ${MONGO_AUTH_DB} --db ${MONGO_DB} --gzip --archive > ${FILE_PATH}/${FILE_PREFIX}.${FILE_EXT}.${current_time}

find ${FILE_PATH} -name '${FILE_PREFIX}.${FILE_EXT}.*' -type f | sort -r | tail -n +${tailnum} | xargs -i echo "rm -rf {}"
find ${FILE_PATH} -name '${FILE_PREFIX}.${FILE_EXT}.*' -type f | sort -r | tail -n +${tailnum} | xargs rm -rf
