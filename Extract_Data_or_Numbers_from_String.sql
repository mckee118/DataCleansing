--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*---
--FUNCTION TO EXTRACT EITHER NUMBERS OR LETTERS FROM A STRING OR FIELD--
--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*---

--USAGE: fn_extract_chars(string_or_field_to_search, 'letters' -or- 'numbers')
--FIRST PART IS THE FUNCTION NAME THEN 2 PARAMETERS:
--1) INPUT THE STRING WITH QUOTES OR THE FIELD NAME
--2) ENTER EITHER 'LETTERS' OR 'NUMBERS' DEPENDING ON WHAT YOU WANT OUTPUT

CREATE FUNCTION fn_extract_chars(@x VARCHAR(128), @y CHAR(7))
RETURNS VARCHAR(128)
AS
BEGIN
DECLARE @chars VARCHAR(128)
DECLARE @pos INT
DECLARE @action VARCHAR(32)
SET @pos = 0
SET @chars = ''

IF @y = 'numbers' SET @action = '[0-9]'
ELSE IF @y = 'letters' SET @action = '[a-zA-Z]'

WHILE @pos < (DATALENGTH(@x) + 1)
BEGIN
IF PATINDEX(@action,SUBSTRING(@x, @pos, 1)) > 0
BEGIN
SET @chars = @chars + (SELECT substring(@x, @pos, 1))
END
SET @pos = @pos + 1 
END
RETURN(@chars)
END