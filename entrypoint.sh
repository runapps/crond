#!/bin/sh
sed -i 's/${MONGO_HOST}/'${MONGO_HOST}'/g' script.sh
sed -i 's/${MONGO_PORT}/'${MONGO_PORT}'/g' script.sh
sed -i 's/${MONGO_USER}/'${MONGO_USER}'/g' script.sh
sed -i 's/${MONGO_PASS}/'${MONGO_PASS}'/g' script.sh
sed -i 's/${MONGO_AUTH_DB}/'${MONGO_AUTH_DB}'/g' script.sh
sed -i 's/${MONGO_DB}/'${MONGO_DB}'/g' script.sh
sed -i 's/${FILE_PREFIX}/'${FILE_PREFIX}'/g' script.sh
sed -i 's/${FILE_EXT}/'${FILE_EXT}'/g' script.sh
sed -i 's/${FILE_RETENTION}/'${FILE_RETENTION}'/g' script.sh

/usr/bin/crontab /etc/cron.d/cronjob
cron -f
