--**********************************************************************

--Numbers from address1,2,3,etc + Whole Postcode (UPCID_N_WP)
REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-, 'numbers') + ISNULL(POSTCODE, ''), ' ', '')

--**********************************************************************


--Numbers from address1,2,3,etc + Numbers from Postcode (UPCID_N_NP)
REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc- +ISNULL(POSTCODE, ''), 'numbers'), ' ', '')

--**********************************************************************

--Whole strings from Address1,2,3,etc + Whole Postcode (UPCID_WS_WP)
REPLACE(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc- +ISNULL(POSTCODE, ''), ' ', '')

--**********************************************************************

--Whole strings from Address1,2,3,etc + Numbers from Postcode (UPCID_WS_NP)
REPLACE(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc- +POINTER.DBO.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', '')

--**********************************************************************

--Just characters from strings Address1,2,3,etc + Whole Postcode (UPCID_CS_WP)
REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-, 'letters') + ISNULL(POSTCODE, ''), ' ', '')

--**********************************************************************

--Just characters from strings Address1,2,3,etc + Numbers from Postcode (UPCID_CS_NP)
REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc- , 'letters')+POINTER.DBO.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', '')

--*********************************************************************

--Numbers from string + no vowels or doubles in strings + whole postcode (UPCID_N_NVD_WP)
REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-, 'numbers')+CENSUS2011.DBO.nvd(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-) +ISNULL(POSTCODE, ''), ' ', '')

--*********************************************************************

--Numbers from string + no vowels or doubles in strings + numbers from postcode (UPCID_N_NVD_NP)
REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-, 'numbers')+CENSUS2011.DBO.nvd(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-) +POINTER.DBO.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', '')

--*********************************************************************

--No vowels or doubles in strings + whole postcode (UPCID_NVD_WP)
REPLACE(CENSUS2011.DBO.nvd(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-) +ISNULL(POSTCODE, ''), ' ', '')

--*********************************************************************

--No vowels or doubles in strings + numbers from postcode (UPCID_NVD_NP)
REPLACE(CENSUS2011.DBO.nvd(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-) +POINTER.DBO.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', '')

--*********************************************************************

--Numbers + first char of address + whole Postcode (UPCID_N_FC_WP)
REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-, 'numbers')+LEFT(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-, 'letters'), 1)+ISNULL(POSTCODE, ''), ' ', '')

--*********************************************************************

--Numbers + first char of address + numbers of Postcode (UPCID_N_FC_NP)
REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-, 'numbers')+LEFT(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-, 'letters'), 1)+POINTER.DBO.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', '')

--*********************************************************************

--Numbers + first three char of address + whole Postcode (UPCID_N_3C_WP)
REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-, 'numbers')+LEFT(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-, 'letters'), 3)+ISNULL(POSTCODE, ''), ' ', '')

--*********************************************************************

--Numbers + first three char of address + numbers of Postcode (UPCID_N_3C_NP)
REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-, 'numbers')+LEFT(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ -etc-, 'letters'), 3)+POINTER.DBO.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', '')


DECLARE @TEST VARCHAR(128)
SET @TEST = '12A JERVIS STREET'
select substring(@TEST, 1, charindex(' ', @TEST) -1)