# docker-laravel

Laravel environment on docker.

## Support 

- PHP-FPM
- Nginx
- MySQL

## Installation

## 1. Add docker-laravel as a submodule

Add docker-laravel as a submodule in your project.

```
$ cd YOUR_PRJECT
$ git submodule add git@github.com:c8112002/docker-laravel.git docker
```

## Usage

### 1. Setup `.env`

Copy `env-exaple` as `.env`.

```
$ cp env-example .env
```

Then, edit `.env` for your environment.

### 2. Build and run containers

```
$ docker-compose up -d
```

### 3. Create a laravel project

```
$ sh scripts/dev.sh create-project
```

### 4. Edit `.env` of Laravel

This is an example of `PROJECT_NAME/.env`.

```
APP_NAME=test
・
・
・
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=test
DB_USERNAME=test
DB_PASSWORD=secret
・
・
・
```