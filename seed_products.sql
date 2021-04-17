DROP DATABASE IF EXISTS  products_db;

CREATE DATABASE products_db;

\c products_db

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  price FLOAT CHECK (price > 0),
  can_be_returned BOOLEAN NOT NULL
);

-- Common Commands
-- \l — List all databases
-- \c DB_NAME — connect to DB_NAME
-- \dt —- List all tables (in current db)
-- \d TABLE_NAME — Get details about TABLE_NAME (in current db)
-- \q — Quit psql (can also type <Control-D>)