#!/bin/bash
echo "Deploying the application..."
docker compose down
docker compose up -d --build
echo "Deployment complete. Checking status..."
docker compose ps
