USE [CENSUS2011]
GO
/****** Object:  UserDefinedFunction [dbo].[nvd]    Script Date: 08/08/2013 10:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[nvd]( @Word varchar(100) )
returns varchar(100)
/****************************************
*** Returns a string without vowels *****
***         or doubles                ***
****************************************/
as
begin

--	declare @strCode  varchar(100)
--	declare @strChar  varchar
	declare @WordLength int 
	declare @ReturnValue varchar(100)
	declare @icounter int 
	declare @pointer int
--	declare @asciivalue int
	
	set @wordlength = len (@word)
	SET @icounter = 1
	set @pointer = -1
	while ( @icounter <= @WordLength )
	BEGIN 
		if not ( SUBSTRING(@Word,@icounter,1)='a' or 
			 SUBSTRING(@Word,@icounter,1)='e'or
			 SUBSTRING(@Word,@icounter,1)='i'or
			 SUBSTRING(@Word,@icounter,1)='o'or
			 SUBSTRING(@Word,@icounter,1)='u')
		Begin
			set @pointer = @icounter
			set @returnvalue = SUBSTRING(@Word,@icounter,1)
			break
		end
	set @icounter = @icounter + 1
	END 

	if (@pointer > 0 )
	BEGIN
		WHILE 	( @pointer <= @WordLength )
		BEGIN
			if not ( SUBSTRING(@Word,@pointer,1)='a' or 
			 SUBSTRING(@Word,@pointer,1)='e'or
			 SUBSTRING(@Word,@pointer,1)='i'or
			 SUBSTRING(@Word,@pointer,1)='o'or
			 SUBSTRING(@Word,@pointer,1)='u')
			Begin
				IF SUBSTRING(@Word,@pointer,1) <> RIGHT (@RETURNVALUE , 1) SET  @RETURNVALUE = @RETURNVALUE + SUBSTRING(@Word,@pointer,1)
			END
			set @pointer = @pointer + 1
		END
	
	END
	ELSE
	BEGIN
		SET @RETURNVALUE = NULL
	END

	RETURN (@returnvalue)
end





