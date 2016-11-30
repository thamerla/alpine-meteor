#!/bin/sh

set -e

: ${DB:="meteor"}
: ${MONGO_URL:="mongodb://${DB_PORT_27017_TCP_ADDR}:${DB_PORT_27017_TCP_PORT}/${DB}"}
: ${PORT:="80"}
: ${ROOT_URL:="http://localhost"}

export MONGO_URL
export PORT
export ROOT_URL

cd /bundle
echo "=> Starting meteor app on port :$PORT"
node main.js
