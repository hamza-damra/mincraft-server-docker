#!/bin/bash

# Simple script to run SQL commands against the Minecraft database
# Usage: ./run_sql.sh "SQL_COMMAND" or ./run_sql.sh < sql_file.sql

DB_HOST="db"
DB_NAME="minecraft-abusaker"
DB_USER="hamza"
DB_PASS="Hh@#2021"

if [ $# -eq 0 ]; then
    # No arguments, read from stdin
    docker exec -i $(docker ps -qf "name=db") mysql -h"$DB_HOST" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME"
else
    # Execute the provided SQL command
    docker exec -i $(docker ps -qf "name=db") mysql -h"$DB_HOST" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "$1"
fi
