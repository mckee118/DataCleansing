dbMemo "SQL" ="SELECT count(COLUMN_NAME) as counter FROM [INFORMATION_SCHEMA].COLUMNS WHERE COL"
    "UMN_NAME LIKE 'upcid%' AND TABLE_NAME = 'pointer'"
dbMemo "Connect" ="ODBC;DSN=address;DATABASE=Address"
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="0"
dbBoolean "LogMessages" ="0"
dbByte "Orientation" ="0"
dbByte "PublishToWeb" ="1"
        dbText "Name" ="1.COLUMN_NAME"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.Expr1000"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.counter"
        dbLong "AggregateType" ="-1"
    End
End
