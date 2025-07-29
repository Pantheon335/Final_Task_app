#!/bin/bash

set -e

aws s3 cp s3://brukhy-terraform-state/configs/backend.env /tmp/backend.env

export $(grep -v '^#' /tmp/backend.env | xargs)

poetry run alembic upgrade head

exec flask run --host=0.0.0.0 --port=5000