#!/bin/bash
SERVICE=$1

if [ -z "$SERVICE" ]; then
    echo "Fetching logs for all services..."
    docker compose logs --tail=50 -f
else
    echo "Fetching logs for service: $SERVICE..."
    docker compose logs --tail=50 -f $SERVICE
fi
