#!/usr/bin/with-contenv bashio
set -e

CONFIG_PATH=/data/options.json

NAME=$(jq --raw-output ".NAME" $CONFIG_PATH)

echo Running flask
python3 app.py

