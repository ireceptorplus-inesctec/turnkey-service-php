#!/bin/sh

SCRIPT_DIR=`dirname "$0"`

# create indexes
sudo docker-compose --file ${SCRIPT_DIR}/docker-compose.yml --project-name turnkey-service exec ireceptor-database \
		sh -c 'cd /app && mongo --quiet /app/scripts/create_indexes.js'

# create query plans
sudo docker-compose --file ${SCRIPT_DIR}/docker-compose.yml --project-name turnkey-service exec ireceptor-database \
		sh -c 'cd /app && mongo --quiet /app/scripts/create_query_plans.js'
