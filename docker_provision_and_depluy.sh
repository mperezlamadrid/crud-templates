#!/bin/bash
set -ex

HEROKU_APP=$1

echo "Building App"
docker build .
echo "Log in to Container Registry"
heroku container:login
echo "Creando App"
heroku create $HEROKU_APP
echo "Set Enviromental Variables"
heroku config:set GO_ENV=production
echo "Adding Postgres plugin"
heroku addons:create heroku-postgresql:hobby-dev
echo "Deploying to Heroku"
heroku container:push web