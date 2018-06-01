# docker-laravel

Laravel environment on docker.

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
