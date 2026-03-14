#!/bin/bash
echo "Checking root endpoint..."
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/)
if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "Root endpoint is reachable (HTTP 200)."
else
    echo "Root endpoint is unhealthy (HTTP $HTTP_STATUS)."
fi

echo "Checking health endpoint..."
curl -s http://localhost/api/health | grep -q "success"
if [ $? -eq 0 ]; then
    echo "Health check passed."
else
    echo "Health check failed."
fi
