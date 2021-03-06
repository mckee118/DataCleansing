USE [POINTER]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_extract_chars]    Script Date: 08/08/2013 10:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_extract_chars](@x varchar(128), @y char(7))
returns varchar(128)
as
begin
declare @chars varchar(128)
declare @pos int
declare @action varchar(32)
set @pos = 0
set @chars = ''

if @y = 'numbers' set @action = '[0-9]'
else if @y = 'letters' set @action = '[a-zA-Z]'

while @pos < (DATALENGTH(@x) + 1)
begin
if PATINDEX(@action,SUBSTRING(@x, @pos, 1)) > 0
begin
set @chars = @chars + (select substring(@x, @pos, 1))
end
set @pos = @pos + 1 
end
return(@chars)
end
