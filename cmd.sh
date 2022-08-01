echo "CREATE DATABASE clairedb;" | psql -U clairedb --no-password
echo "CREATE TABLE IF NOT EXISTS Client (id serial PRIMARY KEY, age INT NOT NULL, name VARCHAR(20) UNIQUE NOT NULL, created_on TIMESTAMP NOT NULL, last_login TIMESTAMP);" | psql -U clairedb --no-password
echo "SELECT id FROM Client;" | psql -U clairedb --no-password