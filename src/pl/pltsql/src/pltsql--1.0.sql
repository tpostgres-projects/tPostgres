/* src/pl/pltsql/src/pltsql--1.0.sql */

/*
 * Currently, all the interesting stuff is done by CREATE LANGUAGE.
 * Later we will probably "dumb down" that command and put more of the
 * knowledge into this script.
 */

CREATE PROCEDURAL LANGUAGE pltsql;

COMMENT ON PROCEDURAL LANGUAGE pltsql IS 'PL/TSQL procedural language';
