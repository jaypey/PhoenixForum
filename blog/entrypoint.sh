#!/bin/bash

DB_USER=${DATABASE_USER:-postgres}

while ! pg_isready -q -U $PGUSER -h $PGHOST -p $PGPORT
do
	echo "$(date) - waiting for database to start"
	sleep 2
done

if [[ -z `psql -Atqc "\\list $PGDATABASE"` ]]; then
	echo "Database $PGDATABASE does not exist. Creating..."
	createdb -E UTF8 $PGDATABASE -l en_US.UTF-8 -T template0
	mix ecto.migrate
	mix run priv/repo/seeds.exs
	echo "Database $PGDATABASE created."
fi
bin="/bin/blog"
exec mix phx.server
