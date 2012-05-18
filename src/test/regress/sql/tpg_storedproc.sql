--
-- Stored Procedures
--

--
-- Test BEGIN and END as subset of word tokens as well as being part of string
-- literals.
--

create procedure begin_blockdepth_check as
declare beginning varchar(20) = 'begin'
begin
    print beginning
end

create procedure end_blockdepth_check as
declare ending varchar(20) = 'end'
begin
    print ending
end

select begin_blockdepth_check();
select end_blockdepth_check();

-- Create a couple of overloaded procedures
create procedure overloaded_proc(@a text) as
begin
    print @a
end

create procedure overloaded_proc(@a int) as
begin
    print @a
end

--
-- Test DROP PROCEDURE
--

-- Ambiguous: should fail
drop procedure overloaded_proc;
-- Should succeed.
drop function overloaded_proc(text);
-- This should succeed too.
drop procedure overloaded_proc;
-- no-op without an error
drop procedure if exists overloaded_proc;