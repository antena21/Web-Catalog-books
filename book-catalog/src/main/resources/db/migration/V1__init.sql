-- Пример миграции Flyway
CREATE TABLE IF NOT EXISTS author (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS book (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS book_author (
    book_id INTEGER NOT NULL REFERENCES book(id),
    author_id INTEGER NOT NULL REFERENCES author(id),
    PRIMARY KEY(book_id, author_id)
);
