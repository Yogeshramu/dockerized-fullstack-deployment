#!/bin/bash
echo "Cleaning up Docker resources..."
docker image prune -af
docker container prune -f
echo "Cleanup complete!"
