-- src/main/resources/db/migration/V1__Initial_schema.sql
CREATE TABLE example (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
