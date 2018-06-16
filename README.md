# docker-laravel

Laravel environment on docker.

## Support 

- PHP-FPM
- Nginx
- MySQL
- [Laravel IDE Helper](https://github.com/barryvdh/laravel-ide-helper)

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

### 4. Configure your laravel project

Edit the configuration files shown below according to your environment.

- `PROJECT_NAME/.env`
- `PROJECT_NAME/config/*.php`

See the [official laravel website](https://laravel.com/docs/installation) if you want to know how to configuration more.