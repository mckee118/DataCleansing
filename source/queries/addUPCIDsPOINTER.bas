﻿dbMemo "SQL" ="UPDATE POINTER SET upcid_n_wp = REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING"
    "_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PR"
    "IMARY_THORFARE, ''), 'numbers') + ISNULL(POSTCODE, ''), ' ', ''),\015\012upcid_n"
    "_np = REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDI"
    "NG_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE,'') + ISNUL"
    "L(POSTCODE, ''), 'numbers'), ' ', ''),\015\012UPCID_WS_WP = dbo.unwanted(REPLACE"
    "(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUM"
    "BER, '') + ISNULL(PRIMARY_THORFARE, '') + ISNULL(POSTCODE, ''), ' ', '')),\015\012"
    "UPCID_WS_NP = dbo.unwanted(REPLACE(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDI"
    "NG_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, '') + dbo."
    "fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', '')),\015\012upcid_cs_wp"
    " = dbo.unwanted(REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISN"
    "ULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, "
    "''), 'letters') + ISNULL(POSTCODE, ''), ' ', '')),\015\012upcid_cs_np = dbo.unwa"
    "nted(REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDIN"
    "G_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'lette"
    "rs') + dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', '')),\015\012"
    "UPCID_N_NVD_WP = dbo.unwanted(REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_N"
    "AME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIM"
    "ARY_THORFARE, ''), 'numbers') + dbo.nvd(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(B"
    "UILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, '')) "
    "+ ISNULL(POSTCODE, ''), ' ', '')),\015\012UPCID_N_NVD_NP = dbo.unwanted(REPLACE("
    "dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') +"
    " ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'numbers') + dbo.nv"
    "d(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NU"
    "MBER, '') + ISNULL(PRIMARY_THORFARE, '')) + dbo.fn_extract_chars(ISNULL(POSTCODE"
    ", ''), 'numbers'), ' ', '')),\015\012UPCID_NVD_WP = dbo.unwanted(REPLACE(dbo.fn_"
    "extract_chars(dbo.nvd(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') "
    "+ ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, '')), 'letters') + ISNU"
    "LL(POSTCODE, ''), ' ', '')),\015\012UPCID_NVD_NP = dbo.unwanted(REPLACE(dbo.fn_e"
    "xtract_chars(dbo.nvd(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') +"
    " ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, '')), 'letters') + dbo.f"
    "n_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', '')),\015\012UPCID_N_FC_W"
    "P = dbo.unwanted(REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + IS"
    "NULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE,"
    " ''), 'numbers') + LEFT(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISN"
    "ULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, "
    "''), 'letters'), 1) + ISNULL(POSTCODE, ''), ' ', '')),\015\012UPCID_N_FC_NP = db"
    "o.unwanted(REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(B"
    "UILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), "
    "'numbers') + LEFT(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BU"
    "ILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), '"
    "letters'), 1) + dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', ''))"
    ",\015\012UPCID_N_3C_WP = dbo.unwanted(REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BU"
    "ILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISN"
    "ULL(PRIMARY_THORFARE, ''), 'numbers') + LEFT(dbo.fn_extract_chars(ISNULL(SUB_BUI"
    "LDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNU"
    "LL(PRIMARY_THORFARE, ''), 'letters'), 3) + ISNULL(POSTCODE, ''), ' ', '')),\015\012"
    "UPCID_N_3C_NP = dbo.unwanted(REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NA"
    "ME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMA"
    "RY_THORFARE, ''), 'numbers') + LEFT(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAM"
    "E, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMAR"
    "Y_THORFARE, ''), 'letters'), 3) + dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 'nu"
    "mbers'), ' ', ''))"
dbMemo "Connect" ="ODBC;DSN=address;DATABASE=Address"
dbBoolean "ReturnsRecords" ="0"
dbInteger "ODBCTimeout" ="0"
dbBoolean "LogMessages" ="0"
dbByte "Orientation" ="0"
dbByte "PublishToWeb" ="1"
End
