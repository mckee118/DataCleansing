dbMemo "SQL" ="SELECT COUNT(*) AS col FROM D_address WHERE uprn IS NULL"
dbMemo "Connect" ="ODBC;DSN=address;DATABASE=Address"
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="0"
dbBoolean "LogMessages" ="0"
dbByte "Orientation" ="0"
dbByte "PublishToWeb" ="1"
        dbText "Name" ="countUPRN.uprn"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.col"
        dbLong "AggregateType" ="-1"
    End
End
