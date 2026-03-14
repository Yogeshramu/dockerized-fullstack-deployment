#!/bin/bash
echo "Restarting services safely..."
docker compose restart
echo "Services restarted. Checking status..."
docker compose ps
