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
