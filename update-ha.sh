#!/bin/bash

# Script to update Home Assistant using docker-compose
# Usage: ./update-ha.sh [--backup /path/to/config]

set -e

echo "Pulling latest Home Assistant image..."
docker-compose pull homeassistant

echo "Recreating Home Assistant container..."
docker-compose up --force-recreate -d homeassistant

echo "Pruning unused images..."
docker image prune -f

echo "Done!"