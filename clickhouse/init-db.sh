#!/bin/bash
set -e

DB01_DATA_PATH=/var/lib/clickhouse/data/db01
DB02_DATA_PATH=/var/lib/clickhouse/data/db02

DB01_DATA_ALREADY_EXISTS=
DB02_DATA_ALREADY_EXISTS=

if [ -d "$DB01_DATA_PATH" ]; then
  DB01_DATA_ALREADY_EXISTS='true'
  echo "Data dir $DB01_DATA_PATH exist."
fi

if [ -d "$DB02_DATA_PATH" ]; then
  DB02_DATA_ALREADY_EXISTS='true'
  echo "Data dir $DB02_DATA_PATH exist."
fi

if [ -z "$DB01_DATA_ALREADY_EXISTS" ] && [ -z "$DB02_DATA_ALREADY_EXISTS" ]; then
  echo "Both $DB01_DATA_PATH and $DB02_DATA_PATH do not exists, start to init the database."
  clickhouse client -n < /setup.sql
else
  echo "No databases need init, will start clickhouse normally."
fi
