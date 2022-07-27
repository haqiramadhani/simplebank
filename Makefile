postgres:
	docker-compose up -d

createdb:
	docker exec -it postgres_simplebank createdb --username=simplebank --owner=simplebank simplebank

dropdb:
	docker exec -it postgres_simplebank dropdb simplebank

migrateup:
	migrate -path db/migration -database "postgresql://simplebank:SimpleBank2022@localhost:5432/simplebank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://simplebank:SimpleBank2022@localhost:5432/simplebank?sslmode=disable" -verbose down

sqlc:
	docker run --rm -v "D:\Projects\Golang\simplebank:/src" -w /src kjconroy/sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc
