--
-- PLTSQL -- CASE expression
--

CREATE FUNCTION case_in_assignment() RETURNS void AS $$
DECLARE @a text,
        @b int = 1,
        @c text = 'one';
BEGIN
    SET @a = CASE @b WHEN 1 THEN @c ELSE 'other value' END
    PRINT @a
    SET @b = 3
    SET @a = CASE @b WHEN 1 THEN @c ELSE 'other value' END
    PRINT @a
END
$$ LANGUAGE pltsql;

SELECT case_in_assignment();

CREATE PROCEDURE multiple_case_exprs_in_proc AS
DECLARE @a text,
        @b int = 1,
        @c text = 'one';
BEGIN
    SET @a = CASE @b WHEN 1 THEN @c ELSE 'other value' END
    PRINT @a
    SET @b = 3
    SET @a = CASE WHEN @b = 1 THEN @c ELSE 'other value' END
    PRINT @a
    SELECT CASE @b WHEN 1 THEN @c ELSE 'other value' END INTO @a;
    PRINT @a
    IF true
        SET @a = CASE WHEN @b = 1 THEN @c ELSE 'NEW' END
    ELSE
        SET @a = 'NEWER'
    PRINT @a
END

SELECT multiple_case_exprs_in_proc();
