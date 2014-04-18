dbMemo "SQL" ="SELECT COLUMN_NAME FROM [INFORMATION_SCHEMA].COLUMNS WHERE COLUMN_NAME = 'uprn' "
    "AND TABLE_NAME = 'G_Address'"
dbMemo "Connect" ="ODBC;DSN=address;DATABASE=Address"
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "LogMessages" ="0"
dbByte "Orientation" ="0"
dbByte "PublishToWeb" ="1"
        dbText "Name" ="1.COLUMN_NAME"
        dbLong "AggregateType" ="-1"
    End
End
