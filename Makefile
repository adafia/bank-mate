postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root bank-mate

dropdb:
	docker exec -it postgres12 dropdb bank-mate

migrateup:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/bank-mate?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/bank-mate?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/adafia/bank-mate/db/sqlc Store

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test server mock