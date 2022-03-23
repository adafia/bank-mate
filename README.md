# bank-mate

## Database Design

SQL Dialect: Postgresql

## Project Set-up

1. After installing docker and cloning this project from github, change directory into the root of the project and run `make postgres`.

2. Run `make creatdb` to create the project's database

### Database Set-up

- Install docker

- Follow the quick [setup guide](https://hub.docker.com/_/postgres) to install the postgres image. This project uses the 12:alpine image.

>Setting up and Starting the postgres:12 alpine image

`docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=<your_postgres_user_eg:root> -e POSTGRES_PASSWORD=<your_password> -d postgres:12-alpine`

### Migrations

> Running the first DB migration

`migrate create -ext sql -dir db/migration -seq init_schema`

> Up Script: makes a forward change to the schema

`migrate up`

> Down Script: revert change made by the up-script

`migrate down`

## Tools

- Golang
- Docker
- Golang-Migrate. [Documentation](https://github.com/golang-migrate/migrate/tree/master/cmd/migrate)

### Docker Commands

> Start Postgres Container

`docker start postgres12`

> Stop Postgres Container

`docker stop postgres12`
