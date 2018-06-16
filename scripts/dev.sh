#!/usr/bin/env bash
source `dirname $0`/../.env

cd `dirname $0`/..

setup_laravel_ide_helper () {
    docker-compose exec app bash -c "cd \"./$APP_NAME\" && \
    composer require --dev barryvdh/laravel-ide-helper && \
    sed -i -e '/public function register()/,/}/ s/\/\//if (\$this->app->environment() === \"local\") {\n            \$this->app->register(\\\Barryvdh\\\LaravelIdeHelper\\\IdeHelperServiceProvider::class); \n        }/g' ./app/Providers/AppServiceProvider.php && \
    php artisan ide-helper:generate
    "
}

create_project () {
    docker-compose exec app composer create-project --prefer-dist "laravel/laravel=$LARAVEL_VERSION" "$APP_NAME" && \
    if $LARAVEL_IDE_HELPER ; then
        setup_laravel_ide_helper
    fi
}

case $1 in
    "create-project") create_project;;
esac
