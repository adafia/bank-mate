# bank-mate

## Database Design

SQL Dialect: Postgresql

## Project Set-up

1. After installing docker and cloning this project from github, change directory into the root of the project and run `make postgres`.

2. Follow the golang migrate [setup guide](https://github.com/golang-migrate/migrate/tree/master/cmd/migrate) to install its CLI tool. This is necessary for running database migrations.

3. Run `make creatdb` to create the project's database.

4. Run `go mod tidy` to install project dependencies.

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
- SQLC. [Documentation](https://docs.sqlc.dev/en/latest/index.html)
- SQLC configuration [guide](https://docs.sqlc.dev/en/latest/reference/config.html)
- Lib/pq. Postgres Driver [github](https://github.com/lib/pq)
- Testify: Test assertion library [github](https://github.com/stretchr/testify)
- Viper: Read .env variables [github](https://github.com/spf13/viper)
- GoMock: Mock Database [github](https://github.com/golang/mock)

### Docker Commands

> Start Postgres Container

`docker start postgres12`

> Stop Postgres Container

`docker stop postgres12`

## Database Philosophy for Transactions

Application of ACID Property

### Atomicity(A)

Either all operations complete successfully or the transaction fails and the db is unchanged

### Consistency(C)

The db state must be valid after the transaction. All constraints must be satisfied.

### Isolation(I)

Concurrent transactions must not affect each other.

### Durability(D)

Data written by a successful transaction must be recorded in persistent storage.
