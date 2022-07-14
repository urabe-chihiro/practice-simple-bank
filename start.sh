#!/bin/sh

# This file will be run by `/bin/sh`,
# because we're using Alpine image, so the bash shell is not available. We use set -e instruction to make sure that the script will exit immediately if a command returns a non-zero status.

set -e

echo "run db migration"
source /app/app.env
/app/migrate -path /app/migration -database "$DB_SOURCE" -verbose up


echo "start the app"
exec "$@"
