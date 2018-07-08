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

edit_laravel_dotenv () {
    app_name="s/\(APP_NAME\)=.*/\1=$APP_NAME/g"
    db_host="s/\(DB_HOST\)=.*/\1=mysql/g"
    db_database="s/\(DB_DATABASE\)=.*/\1=$MYSQL_DATABASE/g"
    db_user="s/\(DB_USERNAME\)=.*/\1=$MYSQL_USER/g"
    db_password="s/\(DB_PASSWORD\)=.*/\1=$MYSQL_PASSWORD/g"

    docker-compose exec app sed -i -e "$app_name" -e "$db_host" -e "$db_database" -e "$db_user" -e "$db_password" "$APP_NAME/.env"
}

edit_app_config () {
    timezone="s:\('timezone'\) => '.*':\1 => '$TIMEZONE':g"
    locale="s:\('locale'\) => '.*':\1 => '$LOCALE':g"
    fallback_locale="s:\('fallback_locale'\) => '.*':\1 => '$LOCALE':g"

    docker-compose exec app sed -i -e "$timezone"  -e "$locale"  -e "$fallback_locale" "$APP_NAME/config/app.php"
}

edit_session_config () {
    driver="s:\('SESSION_DRIVER'\), '.*':\1, '$LARAVEL_SESSION_DRIVER':g"

    docker-compose exec app sed -i -e "$driver" "$APP_NAME/config/session.php"
}


create_project () {
    docker-compose exec app composer create-project --prefer-dist "laravel/laravel=$LARAVEL_VERSION" "$APP_NAME" && \
    if $LARAVEL_IDE_HELPER ; then
        setup_laravel_ide_helper
    fi
    edit_laravel_dotenv
    edit_app_config
    edit_session_config
}

watch () {
    docker-compose exec node bash -c "cd \"./$APP_NAME\" && \
    yarn install && \
    yarn run watch
    "
}

case $1 in
    "create-project") create_project;;
    "watch") watch;;
esac
