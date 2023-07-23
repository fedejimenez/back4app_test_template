#!/bin/bash
set -e

# If the database exists, migrate. Otherwise setup (create and migrate)
echo "Running database migrations..."
(rake db:migrate:status 2>/dev/null || rake db:setup) && rake db:migrate
echo "Finished running database migrations."

# Remove a potentially pre-existing server.pid for Rails.
echo "Deleting server.pid file..."
rm -f /back4app_test_template/tmp/pids/server.pids

# Then exec the container's main process (what's set as CMD in the Dockerfile)
exec "$@"
