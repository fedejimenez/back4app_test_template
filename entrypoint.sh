#!/bin/bash
set -e

# If the database exists, migrate. Otherwise setup (create and migrate)
echo "Running database migrations..."
if bundle exec rails db:exists; then
  bundle exec rails db:migrate
else
  bundle exec rails db:create
  bundle exec rails db:migrate
  bundle exec rails db:seed
fi
echo "Finished running database migrations."

# Remove a potentially pre-existing server.pid for Rails.
echo "Deleting server.pid file..."
rm -f /back4app_test_template/tmp/pids/server.pids

# Then exec the container's main process (what's set as CMD in the Dockerfile)
exec "$@"
