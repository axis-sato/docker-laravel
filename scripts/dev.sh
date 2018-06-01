#!/usr/bin/env bash
source `dirname $0`/../.env

cd `dirname $0`/..

case $1 in
    "create-project") docker-compose exec app composer create-project --prefer-dist "laravel/laravel=$LARAVEL_VERSION" "$PROJECT_NAME";;
esac
