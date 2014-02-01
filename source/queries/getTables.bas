dbMemo "SQL" ="SELECT TABLE_NAME \015\012FROM INFORMATION_SCHEMA.TABLES\015\012WHERE TABLE_TYPE"
    " = 'BASE TABLE'"
dbMemo "Connect" ="ODBC;DSN=address;DATABASE=Address"
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "LogMessages" ="0"
dbByte "Orientation" ="0"
dbByte "PublishToWeb" ="1"
        dbText "Name" ="1.TABLE_NAME"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="TABLE_NAME"
    End
End
