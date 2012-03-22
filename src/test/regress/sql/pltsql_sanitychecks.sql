--
-- PLTSQL -- Sanity checks
--           This is supposed to be the last PL/TSQL test category.
--
--

-- The count for our various #test* local temporary tables should be zero now as
-- they should not exist anymore.
SELECT COUNT(relname) FROM pg_class WHERE relname LIKE '#test%';