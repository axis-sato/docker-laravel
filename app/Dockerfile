ARG PHP_VERSION

FROM php:${PHP_VERSION}-fpm

ARG APP_CONTAINER_PATH

RUN apt-get update && apt-get install -y mysql-client \
    # php extension
    && docker-php-ext-install pdo_mysql && \
    # zip, upzip
    apt-get install -y zip unzip && \
    # composer
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
    # add user
    # useradd -ms /bin/bash -u 1000 php && \
    # chown -R php:php "${APP_CONTAINER_PATH}"

# USER php
WORKDIR ${APP_CONTAINER_PATH}
