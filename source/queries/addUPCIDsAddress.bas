﻿dbMemo "SQL" ="Update G_Address set upcid_n_wp = REPLACE(DBO.fn_extract_chars(ISNULL(Address1, "
    "'')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'numbers') +"
    " ISNULL(POSTCODE, ''), ' ', '')Update G_Address set upcid_n_np = REPLACE(DBO.fn_"
    "extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISN"
    "ULL(Address4, '')+ISNULL(POSTCODE, ''), 'numbers'), ' ', '')"
dbMemo "Connect" ="ODBC;DSN=address;DATABASE=Address"
dbBoolean "ReturnsRecords" ="0"
dbInteger "ODBCTimeout" ="0"
dbBoolean "LogMessages" ="0"
dbByte "Orientation" ="0"
dbByte "PublishToWeb" ="1"
End
