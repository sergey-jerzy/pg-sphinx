CREATE TYPE sphinx_search_result AS (id int, weight int);

CREATE OR REPLACE FUNCTION sphinx_select(
  /*index*/     varchar,
  /*query*/     varchar,
  /*condition*/ varchar,
  /*order*/     varchar,
  /*offset*/    int,
  /*limit*/     int,
  /*options*/   varchar)
RETURNS SETOF sphinx_search_result
AS 'libpgsphinx', 'pg_sphinx_select'
LANGUAGE C IMMUTABLE;

CREATE OR REPLACE FUNCTION sphinx_replace(
  /*index*/     varchar,
  /*id*/        int,
  /*data*/      varchar[])
RETURNS VOID
AS 'libpgsphinx', 'pg_sphinx_replace'
LANGUAGE C IMMUTABLE;

CREATE OR REPLACE FUNCTION sphinx_delete(
  /*index*/     varchar,
  /*id*/        int)
RETURNS VOID
AS 'libpgsphinx', 'pg_sphinx_delete'
LANGUAGE C IMMUTABLE;

CREATE OR REPLACE FUNCTION sphinx_snippet(
  /*index*/     varchar,
  /*query*/     varchar,
  /*data*/      varchar,
  /*before*/    varchar,
  /*after*/     varchar)
RETURNS VARCHAR
AS 'libpgsphinx', 'pg_sphinx_snippet'
LANGUAGE C IMMUTABLE;

