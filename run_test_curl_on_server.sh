#!/bin/bash

set -e

minikube kubectl -- expose deployment nginx-world --type=NodePort --port=80

# Get the service URL
service_url=$(minikube service nginx-world --url )

sleep 5
echo $service_url
# Make a curl request to the service URL and echo the response
curl_response=$(curl -s "$service_url")

echo "$curl_response"
if ! echo "$curl_response" | grep -q "Welcome to Cloud"; then
  echo "String not found: Welcome to Cloud"
  exit 1  # Fail the script
fi
