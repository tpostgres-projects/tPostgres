-- pltsqldbg.sql
--  This script creates the data types and functions defined by the PL debugger API
--
-- Portions Copyright (c) 2011-2012, TPOSTGRES.  All Rights Reserved.
--
-- Copyright (c) 2004-2007 EnterpriseDB Corporation. All Rights Reserved.
--
-- Licensed under the Artistic License, see 
--		http://www.opensource.org/licenses/artistic-license.php
-- for full details

CREATE OR REPLACE FUNCTION pltsql_oid_debug( functionOID OID ) RETURNS INTEGER
  AS '$libdir/plugins/plugin_tsql_debugger' LANGUAGE C STRICT;
