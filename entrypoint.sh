#!/bin/bash
set -e

# remove a potencially pre-existing server.pid for Rails
rm -f /back4app_test_template/tmp/pids/server.pids

# Then exec the container's main process (what's set as CMD in the Dockerfile)
exec "$@"
