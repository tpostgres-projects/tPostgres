/* src/pl/pltsql/src/pltsql--unpackaged--1.0.sql */

ALTER EXTENSION pltsql ADD PROCEDURAL LANGUAGE pltsql;
-- ALTER ADD LANGUAGE doesn't pick up the support functions, so we have to.
ALTER EXTENSION pltsql ADD FUNCTION pltsql_call_handler();
ALTER EXTENSION pltsql ADD FUNCTION pltsql_inline_handler(internal);
ALTER EXTENSION pltsql ADD FUNCTION pltsql_validator(oid);
