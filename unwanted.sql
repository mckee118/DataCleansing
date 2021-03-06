USE [HEALTH]
GO
/****** Object:  UserDefinedFunction [dbo].[unwanted]    Script Date: 08/08/2013 10:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[unwanted] (@theString VARCHAR(100))

RETURNS VARCHAR(100)
AS
BEGIN
declare @unwantedStrings table (item varchar(50))

INSERT INTO @unwantedStrings(item)
SELECT 'flat' UNION ALL
SELECT 'unit' UNION ALL
SELECT 'site' UNION ALL
SELECT 'apartment' UNION ALL
SELECT 'flt' UNION ALL
SELECT 'apt' UNION ALL
SELECT '.' UNION ALL
SELECT '-' UNION ALL
SELECT '/' UNION ALL
SELECT ','

SELECT @theString = REPLACE(@theString, item, '') FROM @unwantedStrings

RETURN(@theString)
END


