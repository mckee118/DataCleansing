﻿dbMemo "SQL" ="SELECT a.address1, a.address2, a.address3, a.address4, a.address5, a.postcode AS"
    " addPostcode, a.uprn AS addUPRN, p.building_number, p.primary_thorfare, p.townla"
    "nd, p.town, p.county, p.postcode AS POINTPostcode, p.uprn AS POINTUPRN FROM D_ad"
    "dress AS a INNER JOIN POINTER AS p ON a.uprn = p.uprn"
dbMemo "Connect" ="ODBC;DSN=address;DATABASE=Address"
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="0"
dbBoolean "LogMessages" ="0"
dbByte "Orientation" ="0"
dbByte "PublishToWeb" ="1"
        dbText "Name" ="1.address1"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.address2"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.address3"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.address4"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.address5"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.addPostcode"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.addUPRN"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.upcid_n_wp"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.building_number"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.primary_thorfare"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.POINTPostcode"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="1.POINTUPRN"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="address1"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="address2"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="address3"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="address4"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="address5"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="addPostcode"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="addUPRN"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="upcid_n_wp"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="building_number"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="primary_thorfare"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="POINTPostcode"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="POINTUPRN"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="upcid_ws_wp"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="upcid_n_nvd_wp"
        dbLong "AggregateType" ="-1"
    End
        dbText "Name" ="townland"
    End
        dbText "Name" ="town"
    End
        dbText "Name" ="county"
    End
End
