postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=truuser -e POSTGRES_PASSWORD=trupwd -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=truuser --owner=truuser ezytutors

dropdb:
	docker exec -it postgres12 dropdb --username=truuser --owner=truuser ezytutors

insert:
	docker exec -it postgres12 psql --username=truuser --dbname=ezytutors < ./tutor-db/src/database.sql

run:
	cargo run -p tutor-db

.PHONY: postgres createdb dropdb
