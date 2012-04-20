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
