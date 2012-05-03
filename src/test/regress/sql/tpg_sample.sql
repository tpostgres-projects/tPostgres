--
-- PL/TSQL Sample
--
--      We keep this as part of the RTS tests so this user-visible sample code
--      is frequently tested.
--

--
-- Localize our sample objects into a separate schema.
--

DROP SCHEMA IF EXISTS pltsql_sample CASCADE;
CREATE SCHEMA pltsql_sample;

-- We prepend to keep previous entries and to facilitate interactive samples.
UPDATE pg_settings
SET    setting = 'pltsql_sample,' || setting
WHERE  name = 'search_path';

--
-- Create the PL/TSQL Extension if it doesn't exist.
--

CREATE EXTENSION IF NOT EXISTS pltsql;

--
-- Create associated objects.
--

CREATE TABLE customers (
  id            INT  IDENTITY,
  company       VARCHAR(20),
  huge_profits  MONEY
);

--
-- PL/TSQL stored procedures
--

--
-- Canonical HelloWorld but with a looping twist.
--
-- Demonstrates at-prefixed parameters, default param value, at-prefixed
-- variable DECLARation, WHILE and PRINT statements.
--
CREATE PROCEDURE HelloWorld(@Count INT, @Message VARCHAR(50) = 'Hello world') AS
DECLARE @i INT
BEGIN
   SET @i = 0

   -- PRINT "Hello World" @count times
   WHILE @i < @Count
   BEGIN
     PRINT @Message
     SET @i = @i + 1
   END

END

SELECT HelloWorld(5);

-- Demonstrates IF EXISTS (SELECT ...) and SET statements.
CREATE PROCEDURE TSQL101 AS
DECLARE
  @stop_innovating_in_a_mature_industry   VARCHAR(20),
  @check_out_tpostgres_on_linux_osx_win   VARCHAR(20)
BEGIN
  IF EXISTS (SELECT huge_profits FROM customers WHERE company = 'Microsoft')
    SET @stop_innovating_in_a_mature_industry = 'Yes'
  ELSE
    SET @check_out_tpostgres_on_linux_osx_win = 'Definitely'
  PRINT 'Enterprise tPostgres is a No Brainer.'
END

SELECT TSQL101();

-- Demonstrates CURSOR DECLARation and use.
CREATE PROCEDURE PrintSQLFTableName AS

DECLARE @TableName VARCHAR(50);

DECLARE #c CURSOR FOR
  SELECT   table_name
  FROM     information_schema.tables
  WHERE    table_schema = 'information_schema'
    AND    table_name LIKE 'sql_f%';

BEGIN
  PRINT 'SQL Features Table Name:';

  OPEN #c;
  FETCH NEXT FROM #c INTO @TableName;
  PRINT @TableName;

  CLOSE #c;
END

SELECT PrintSQLFTableName();

-- Multiple comma-separated at-prefixed variable DECLARations, assignments, and
-- the IF statement with an ELSE branch.
CREATE PROCEDURE MultipleDeclarations AS
DECLARE @foo INT,
        @bar INT = 12,
        @baz VARCHAR(50)
BEGIN
  SET @baz = 'A single-digit value'

  -- Print the value if it's double digit or above
  IF @bar > 9
    PRINT @bar
  ELSE
    PRINT @baz

END

SELECT MultipleDeclarations();

-- WHILE loop with a CONTINUE statement.
CREATE PROCEDURE WhileWithContinue AS
DECLARE @i INT = 1;
BEGIN
  WHILE @i <= 7
  BEGIN
    PRINT @i;
    SET @i = @i + 1;
    CONTINUE; -- Jump to the next iteration
    PRINT 'This should never be printed.';
  END
END

SELECT WhileWithContinue();

--
-- Automagic local temporary table creation with the '#' prefix and its use in
-- SQL.  We also use an at-prefixed var in SQL within a WHILE loop body.
--
CREATE PROCEDURE TempTable AS
DECLARE @val INT = 1
BEGIN
  CREATE TABLE #test (a int);
  WHILE @val <= 3
  BEGIN
    INSERT INTO #test VALUES (@val);
    SET @val = @val + 1
  END
END

SELECT TempTable();
