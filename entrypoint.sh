#!/bin/bash

# sed는 특수문자 앞에 \를 붙여야한다
# bash 변수문자열치환 방법 ${variable//search/replace}
# replace / -> \/ for sed
file_path=${FILE_PATH//\//\\/}
cron_schedule=${CRON_SCHEDULE//\//\\/}

mkdir -p ${FILE_PATH}
sed -i 's/${MONGO_HOST}/'${MONGO_HOST}'/g' script.sh
sed -i 's/${MONGO_PORT}/'${MONGO_PORT}'/g' script.sh
sed -i 's/${MONGO_USER}/'${MONGO_USER}'/g' script.sh
sed -i 's/${MONGO_PASS}/'${MONGO_PASS}'/g' script.sh
sed -i 's/${MONGO_AUTH_DB}/'${MONGO_AUTH_DB}'/g' script.sh
sed -i 's/${MONGO_DB}/'${MONGO_DB}'/g' script.sh
sed -i 's/${FILE_PATH}/'${file_path}'/g' script.sh
sed -i 's/${FILE_PREFIX}/'${FILE_PREFIX}'/g' script.sh
sed -i 's/${FILE_EXT}/'${FILE_EXT}'/g' script.sh
sed -i 's/${FILE_RETENTION}/'${FILE_RETENTION}'/g' script.sh
sed -i 's/\* \* \* \* \*/'"${cron_schedule}"'/g' /etc/cron.d/cronjob

/usr/bin/crontab /etc/cron.d/cronjob
cron -f
