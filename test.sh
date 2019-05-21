#!/bin/sh

sed 's/${MONGO_HOST}/'${MONGO_HOST}'/g' script.sh
