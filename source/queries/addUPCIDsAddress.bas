﻿dbMemo "SQL" ="Update G_Address set upcid_ws_wp = dbo.unwanted(REPLACE(ISNULL(Address1, '')+ISN"
    "ULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, '')+ISNULL(POSTCODE, '')"
    ", ' ', ''))Update G_Address set upcid_n_nvd_wp = dbo.unwanted(REPLACE(DBO.fn_ext"
    "ract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL"
    "(Address4, ''), 'numbers')+DBO.nvd(ISNULL(Address1, '')+ISNULL(Address2, '')+ISN"
    "ULL(Address3, '')+ISNULL(Address4, '')) +ISNULL(POSTCODE, ''), ' ', ''))"
dbMemo "Connect" ="ODBC;DSN=address;DATABASE=Address"
dbBoolean "ReturnsRecords" ="0"
dbInteger "ODBCTimeout" ="0"
dbBoolean "LogMessages" ="0"
dbByte "Orientation" ="0"
dbByte "PublishToWeb" ="1"
End
