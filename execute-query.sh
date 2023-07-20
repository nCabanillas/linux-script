#!/bin/bash

# Set the necessary variables
DB_HOST="172.17.0.3"
DB_USER="root"
DB_PASS="admin"
DB_NAME=$1

for param in "$@"; do
  if [ "$param" == "$1" ];then
    continue
  fi
  # Define your SQL queries here
  SQL_QUERY_1="TRUNCATE TABLE $param;"

  # Function to execute the SQL queries
  execute_sql_query() {
    QUERY="$1"
    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -D "$DB_NAME" -e "$QUERY"
  }

  # Call the function for each SQL query
  execute_sql_query "$SQL_QUERY_1"
done
