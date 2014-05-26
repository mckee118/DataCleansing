dbMemo "SQL" ="SELECT COLUMN_NAME FROM [INFORMATION_SCHEMA].COLUMNS WHERE COLUMN_NAME LIKE 'upc"
    "id%' AND TABLE_NAME = 'D_address'"
dbMemo "Connect" ="ODBC;DSN=address;DATABASE=Address"
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbByte "PublishToWeb" ="1"
dbBoolean "LogMessages" ="0"
        dbText "Name" ="COLUMN_NAME"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.COLUMN_NAME"
        dbLong "AggregateType" ="-1"
    End
End
