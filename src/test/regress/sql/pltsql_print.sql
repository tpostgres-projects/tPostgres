--
-- PLTSQL
--

CREATE OR REPLACE FUNCTION hello_tsql() RETURNS void AS $$
BEGIN
    PRINT 'Hello World, T-SQL Style.';
END
$$ LANGUAGE pltsql;