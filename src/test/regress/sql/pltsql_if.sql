--
-- PLTSQL -- IF Statement
--

CREATE FUNCTION if_with_semicolon() RETURNS void AS $$
BEGIN
    IF true THEN
        PRINT 'true'
    END IF;
END
$$ LANGUAGE pltsql;

SELECT if_with_semicolon();

CREATE FUNCTION if_without_semicolon() RETURNS void AS $$
BEGIN
    IF true THEN
        PRINT 'true'
    END IF
END
$$ LANGUAGE pltsql;

SELECT if_without_semicolon();

CREATE FUNCTION if_without_then() RETURNS void AS $$
BEGIN
    IF true
        PRINT 'true'
    END IF
END
$$ LANGUAGE pltsql;

SELECT if_without_then();

CREATE FUNCTION if_elsif_without_then() RETURNS void AS $$
DECLARE @a int
BEGIN
    SET @a = 1
    IF 2 > @a
        UPDATE pg_settings SET setting = 'notupdated' WHERE name = 'nonexistent';
    ELSIF @a = 1
        SET @a = 2
    ELSIF @a = 2
        SET @a = 3
    ELSE
        SET @a = NULL
    END IF
END
$$ LANGUAGE pltsql;

SELECT if_elsif_without_then();
