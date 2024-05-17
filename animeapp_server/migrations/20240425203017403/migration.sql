BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "anime" (
    "id" serial PRIMARY KEY,
    "title" text NOT NULL,
    "year" integer NOT NULL,
    "imageUrl" text NOT NULL,
    "logline" text NOT NULL
);


--
-- MIGRATION VERSION FOR animeapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('animeapp', '20240425203017403', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240425203017403', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
