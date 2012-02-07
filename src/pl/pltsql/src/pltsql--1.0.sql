/* src/pl/pltsql/src/pltsql--1.0.sql */

/*
 * Cluster-wide objects are not tracked as EXTENSION members.  As pg_pltemplate
 * is a shared catalog, we need to make the pltsql entry in a resilient manner.
 *
 * We do not want a "CREATE EXTENSION" invocation to error out if the pltemplate
 * catalog entry already exists e.g. when the user installs the language in a
 * different database under the same cluster.  The user could always CREATE the
 * LANGUAGE directly but that is not recommended.
 *
 * We INSERT the row only if it does not already exist.  We use (SELECT 1 ...)
 * in the subquery as we have no interest in the pltsql record (unique) but the
 * existence status thereof.
 */
INSERT INTO pg_catalog.pg_pltemplate (tmplname, tmpltrusted, tmpldbacreate,
            tmplhandler, tmplinline, tmplvalidator, tmpllibrary)
SELECT      'pltsql', true, true, 'pltsql_call_handler',
            'pltsql_inline_handler', 'pltsql_validator', '$libdir/pltsql'
WHERE NOT EXISTS (
    SELECT 1 FROM pg_catalog.pg_pltemplate WHERE tmplname = 'pltsql');

/*
 * Currently, all the interesting stuff is done by CREATE LANGUAGE.
 * Later we will probably "dumb down" that command and put more of the
 * knowledge into this script.
 */

CREATE PROCEDURAL LANGUAGE pltsql;

COMMENT ON PROCEDURAL LANGUAGE pltsql IS 'PL/TSQL procedural language';
