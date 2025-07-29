#!/bin/bash

set -e

echo "Downloading environment file from S3..."
aws s3 cp s3://brukhy-terraform-state/secrets/backend.env /tmp/backend.env

echo "Exporting variables from backend.env..."
export $(grep -v '^#' /tmp/backend.env | xargs)

echo "Running Alembic migrations..."
poetry run alembic upgrade head

echo "Starting Flask application..."
exec flask run --host=0.0.0.0 --port=5000