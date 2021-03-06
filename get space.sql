USE [HEALTH]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_get_space]    Script Date: 08/08/2013 10:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_get_space](@x varchar(128))
returns int
as
begin
declare @chars varchar(128)
declare @pos int
declare @action varchar(32)
set @pos = 0
set @chars = ''


while @pos < (DATALENGTH(@x) + 1)
begin
if PATINDEX(@action,SUBSTRING(@x, @pos, 1)) > 0
begin
set @chars = @chars + (select substring(@x, @pos, 1))
end
set @pos = @pos + 1
end
return(@pos-1)
end
