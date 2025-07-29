#!/bin/bash

# Load variables from .env file
set -o allexport
source .env-import-workflows
set +o allexport

WORKFLOW_DIR="workflows"

for file in "$WORKFLOW_DIR"/*.json; do
  curl -X POST "$N8N_URL" \
    -H "Content-Type: application/json" \
    -H "X-N8N-API-KEY: $API_KEY" \
    -d @"$file"
done
