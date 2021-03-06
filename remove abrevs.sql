USE [POINTER]
GO
/****** Object:  UserDefinedFunction [dbo].[removeAbrevs]    Script Date: 08/08/2013 10:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[removeAbrevs](@text varchar(128)/*, @Abrev char(15)*/)
RETURNS varchar(128)
AS
BEGIN
	DECLARE @result varchar(128)
	SET @result = REPLACE(UPPER(@text), 'STREET', '')
	SET @result = REPLACE(UPPER(@result), 'ST.', '')
	IF @result LIKE '%' + 'ST'
		BEGIN
			SET @result = SUBSTRING(@result, 1, LEN(@result) - LEN('ST'))
	END
	
	SET @result = REPLACE(UPPER(@result), 'ROAD', '')
	IF @result LIKE '%' + 'RD'
		BEGIN
			SET @result = SUBSTRING(@result, 1, LEN(@result) - LEN('RD'))
	END
	
	SET @result = REPLACE(UPPER(@result), 'DRIVE', '')
	IF @result LIKE '%' + 'DR'
		BEGIN
			SET @result = SUBSTRING(@result, 1, LEN(@result) - LEN('DR'))
	END
	
	SET @result = REPLACE(UPPER(@result), 'AVENUE', '')
	IF @result LIKE '%' + 'AVE'
		BEGIN
			SET @result = SUBSTRING(@result, 1, LEN(@result) - LEN('AVE'))
	END

	SET @result = REPLACE(UPPER(@result), 'GARDENS', '')
	IF @result LIKE '%' + 'GDNS'
		BEGIN
			SET @result = SUBSTRING(@result, 1, LEN(@result) - LEN('GDNS'))
	END

	SET @result = REPLACE(UPPER(@result), 'PARK', '')
	IF @result LIKE '%' + 'PK'
		BEGIN
			SET @result = SUBSTRING(@result, 1, LEN(@result) - LEN('PK'))
	END

	SET @result = REPLACE(UPPER(@result), 'TERRACE', '')
	IF @result LIKE '%' + 'TCE'
		BEGIN
			SET @result = SUBSTRING(@result, 1, LEN(@result) - LEN('TCE'))
	END
	RETURN(@result)
END
