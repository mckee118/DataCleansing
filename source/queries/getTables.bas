dbMemo "SQL" ="SELECT TABLE_NAME\015\012FROM INFORMATION_SCHEMA.TABLES\015\012WHERE TABLE_TYPE "
    "= 'BASE TABLE'\015\012AND TABLE_NAME LIKE '%_Address'\015\012"
dbMemo "Connect" ="ODBC;DSN=address;DATABASE=Address"
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="0"
dbBoolean "LogMessages" ="0"
dbByte "Orientation" ="0"
dbByte "PublishToWeb" ="1"
        dbText "Name" ="1.TABLE_NAME"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="TABLE_NAME"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.COLUMN_NAME"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="COLUMN_NAME"
        dbLong "AggregateType" ="-1"
    End
End
