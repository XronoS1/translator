-- Adminer 4.8.1 PostgreSQL 13.3 (Debian 13.3-1.pgdg100+1) dump

\connect "elements";

DROP TABLE IF EXISTS "authors";
DROP SEQUENCE IF EXISTS authors_id_author_seq;
CREATE SEQUENCE authors_id_author_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."authors" (
    "id_author" integer DEFAULT nextval('authors_id_author_seq') NOT NULL,
    "Sheakspeare" text NOT NULL,
    "Martin" text NOT NULL,
    "Ashley Vans" text NOT NULL,
    CONSTRAINT "authors_pkey" PRIMARY KEY ("id_author")
) WITH (oids = false);


DROP TABLE IF EXISTS "booksDB";
DROP SEQUENCE IF EXISTS "booksDB_id_seq";
CREATE SEQUENCE "booksDB_id_seq" INCREMENT  MINVALUE  MAXVALUE  CACHE ;

CREATE TABLE "public"."booksDB" (
    "id" integer DEFAULT nextval('"booksDB_id_seq"') NOT NULL,
    "book_id" integer NOT NULL,
    "genre_id" integer NOT NULL,
    "author_id" integer NOT NULL,
    CONSTRAINT "booksDB_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "books_genre";
DROP SEQUENCE IF EXISTS books_genre_id_seq;
CREATE SEQUENCE books_genre_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."books_genre" (
    "id" integer DEFAULT nextval('books_genre_id_seq') NOT NULL,
    "fantastic" text NOT NULL,
    "biography" text NOT NULL,
    "classic" text NOT NULL,
    CONSTRAINT "books_genre_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "id_book";
DROP SEQUENCE IF EXISTS id_book_book_id_seq;
CREATE SEQUENCE id_book_book_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."id_book" (
    "book_id" integer DEFAULT nextval('id_book_book_id_seq') NOT NULL,
    "Romeo and Juliet" text NOT NULL,
    "Game of Thrones" text NOT NULL,
    "Who is Elon Musk" text NOT NULL,
    CONSTRAINT "id_book_pkey" PRIMARY KEY ("book_id")
) WITH (oids = false);


ALTER TABLE ONLY "public"."booksDB" ADD CONSTRAINT "booksDB_author_id_fkey" FOREIGN KEY (author_id) REFERENCES authors(id_author) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."booksDB" ADD CONSTRAINT "booksDB_book_id_fkey" FOREIGN KEY (book_id) REFERENCES id_book(book_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."booksDB" ADD CONSTRAINT "booksDB_genre_id_fkey" FOREIGN KEY (genre_id) REFERENCES books_genre(id) ON DELETE CASCADE NOT DEFERRABLE;

-- 2021-10-24 15:24:37.917671+00
