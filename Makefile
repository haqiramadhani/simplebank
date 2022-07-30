postgres:
	docker-compose up -d

createdb:
	docker exec -it postgres_simplebank createdb --username=simplebank --owner=simplebank simplebank

dropdb:
	docker exec -it postgres_simplebank dropdb simplebank

migrateup:
	migrate -path db/migration -database "postgresql://simplebank:SimpleBank2022@localhost:5432/simplebank?sslmode=disable" -verbose up

migrateup1:
	migrate -path db/migration -database "postgresql://simplebank:SimpleBank2022@localhost:5432/simplebank?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://simplebank:SimpleBank2022@localhost:5432/simplebank?sslmode=disable" -verbose down

migratedown1:
	migrate -path db/migration -database "postgresql://simplebank:SimpleBank2022@localhost:5432/simplebank?sslmode=disable" -verbose down 1

sqlc:
	docker run --rm -v "D:\Projects\Golang\simplebank:/src" -w /src kjconroy/sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/haqiramadhani/simplebank/db/sqlc Store

.PHONY: postgres createdb dropdb migrateup migrateup1 migratedown migratedown1 sqlc test server mock
