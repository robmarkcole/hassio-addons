#!/usr/bin/with-contenv bashio
set -e

CONFIG_PATH=/data/options.json

HELLO_NAME="$(bashio::config 'hello_name')"

echo Running flask
python3 app.py

