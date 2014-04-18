--Creating new table for testing UPCID's where download is april 2011
select HEALTH_AUTOID, HEALTHID, FORENAME, MIDNAME, SURNAME, DOB, ADDRESS1, ADDRESS2, ADDRESS3, ADDRESS4, POSTCODE, UPRN
into all_health_UPCID
from all_health
where download = '201104'
--adding new columns to the table
alter table all_health_upcid
add UPCID_N_WP varchar(128), UPCID_N_NP varchar(128), UPCID_WS_WP varchar(128), UPCID_WS_NP varchar(128), UPCID_CS_WP varchar(128), UPCID_CS_NP varchar(128), UPCID_N_NVD_WP varchar(128), UPCID_N_NVD_NP varchar(128), UPCID_NVD_WP varchar(128), UPCID_NVD_NP varchar(128), UPCID_N_FC_WP varchar(128), UPCID_N_FC_NP varchar(128), UPCID_N_3C_WP varchar(128), UPCID_N_3C_NP varchar(128)
--Creating Pointer table
SELECT     SUB_BUILDING_NAME, BUILDING_NAME, BUILDING_NUMBER, PRIMARY_THORFARE, ALT_THORFARE_NAME1, SECONDARY_THORFARE, LOCALITY, TOWNLAND, 
                      TOWN, COUNTY, POSTCODE, BLPU, UNIQUE_BUILDING_ID, UPRN, REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') 
                      + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'numbers') + ISNULL(POSTCODE, ''), ' ', '') AS UPCID_N_WP, 
                      REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, 
                      '') + ISNULL(POSTCODE, ''), 'numbers'), ' ', '') AS UPCID_N_NP, REPLACE(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') 
                      + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, '') + ISNULL(POSTCODE, ''), ' ', '') AS UPCID_WS_WP, REPLACE(ISNULL(SUB_BUILDING_NAME, 
                      '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, '') + dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', 
                      '') AS UPCID_WS_NP, REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') 
                      + ISNULL(PRIMARY_THORFARE, ''), 'letters') + ISNULL(POSTCODE, ''), ' ', '') AS UPCID_CS_WP, REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') 
                      + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'letters') + dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 
                      'numbers'), ' ', '') AS UPCID_CS_NP, REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, 
                      '') + ISNULL(PRIMARY_THORFARE, ''), 'numbers') + CENSUS2011.dbo.nvd(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') 
                      + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, '')) + ISNULL(POSTCODE, ''), ' ', '') AS UPCID_N_NVD_WP, 
                      REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, 
                      ''), 'numbers') + CENSUS2011.dbo.nvd(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') 
                      + ISNULL(PRIMARY_THORFARE, '')) + dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', '') AS UPCID_N_NVD_NP, 
                      REPLACE(dbo.fn_extract_chars(CENSUS2011.dbo.nvd(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') 
                      + ISNULL(PRIMARY_THORFARE, '')), 'letters') + ISNULL(POSTCODE, ''), ' ', '') AS UPCID_NVD_WP, 
                      REPLACE(dbo.fn_extract_chars(CENSUS2011.dbo.nvd(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') 
                      + ISNULL(PRIMARY_THORFARE, '')), 'letters') + dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', '') AS UPCID_NVD_NP, 
                      REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, 
                      ''), 'numbers') + LEFT(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') 
                      + ISNULL(PRIMARY_THORFARE, ''), 'letters'), 1) + ISNULL(POSTCODE, ''), ' ', '') AS UPCID_N_FC_WP, REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, 
                      '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'numbers') 
                      + LEFT(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 
                      'letters'), 1) + dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', '') AS UPCID_N_FC_NP, REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') 
                      + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'numbers') 
                      + LEFT(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 
                      'letters'), 3) + ISNULL(POSTCODE, ''), ' ', '') AS UPCID_N_3C_WP, REPLACE(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') 
                      + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'numbers') + LEFT(dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') 
                      + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'letters'), 3) + dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 
                      'numbers'), ' ', '') AS UPCID_N_3C_NP
INTO		 dbo.pointer_upcid
FROM         dbo.PTRV2_2013_04APR
--updating Pointer UPCID_WS_WP
update pointer.dbo.pointer_upcid
set UPCID_WS_WP = dbo.unwanted(REPLACE(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, '') + ISNULL(POSTCODE, ''), ' ', ''))
--updating Pointer UPCID_WS_NP
update pointer.dbo.pointer_upcid
set UPCID_WS_NP = dbo.unwanted(REPLACE(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, '') + pointer.dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', ''))
--updating pointer UPCID_CS_WP
update pointer.dbo.pointer_upcid
set upcid_cs_wp = dbo.unwanted(REPLACE(pointer.dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'letters') + ISNULL(POSTCODE, ''), ' ', '')) 
--updating pointer UPCID_CS_NP
update pointer.dbo.pointer_upcid
set upcid_cs_np = dbo.unwanted(REPLACE(pointer.dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'letters') + pointer.dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', ''))
--updating pointer UPCID_N_NVD_WP
update pointer.dbo.pointer_upcid
set UPCID_N_NVD_WP = dbo.unwanted(REPLACE(pointer.dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'numbers') + CENSUS2011.dbo.nvd(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, '')) + ISNULL(POSTCODE, ''), ' ', ''))
--updating pointer UPCID_N_NVD_NP
update pointer.dbo.pointer_upcid
set UPCID_N_NVD_NP = dbo.unwanted(REPLACE(pointer.dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'numbers') + CENSUS2011.dbo.nvd(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, '')) + pointer.dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', ''))
--updating pointer UPCID_NVD_WP
update pointer.dbo.pointer_upcid
set UPCID_NVD_WP = dbo.unwanted(REPLACE(pointer.dbo.fn_extract_chars(CENSUS2011.dbo.nvd(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, '')), 'letters') + ISNULL(POSTCODE, ''), ' ', ''))
--updating pointer UPCID_NVD_NP
update pointer.dbo.pointer_upcid
set UPCID_NVD_NP = dbo.unwanted(REPLACE(pointer.dbo.fn_extract_chars(CENSUS2011.dbo.nvd(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, '')), 'letters') + pointer.dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', ''))
--updating pointer UPCID_N_FC_WP
update pointer.dbo.pointer_upcid
set UPCID_N_FC_WP = dbo.unwanted(REPLACE(pointer.dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'numbers') + LEFT(pointer.dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'letters'), 1) + ISNULL(POSTCODE, ''), ' ', ''))
--updating pointer UPCID_N_FC_NP
update pointer.dbo.pointer_upcid
set UPCID_N_FC_NP = dbo.unwanted(REPLACE(pointer.dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'numbers') + LEFT(pointer.dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'letters'), 1) + pointer.dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', ''))
--updating pointer UPCID_N_3C_WP
update pointer.dbo.pointer_upcid
set UPCID_N_3C_WP = dbo.unwanted(REPLACE(pointer.dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'numbers') + LEFT(pointer.dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'letters'), 3) + ISNULL(POSTCODE, ''), ' ', ''))
--updating pointer UPCID_N_3C_NP
update pointer.dbo.pointer_upcid
set UPCID_N_3C_NP = dbo.unwanted(REPLACE(pointer.dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'numbers') + LEFT(pointer.dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, ''), 'letters'), 3) + pointer.dbo.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', ''))
--adding UPCID_N_WP
update dbo.all_health_upcid
set upcid_n_wp = REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'numbers') + ISNULL(POSTCODE, ''), ' ', '')
--adding UPCID_N_NP
update dbo.all_health_upcid
set upcid_n_np = REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, '')+ISNULL(POSTCODE, ''), 'numbers'), ' ', '')
--adding UPCID_WS_WP
update dbo.all_health_upcid
set upcid_ws_wp = dbo.unwanted(REPLACE(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, '')+ISNULL(POSTCODE, ''), ' ', ''))
--adding UPCID_WS_NP
update dbo.all_health_upcid
set upcid_ws_np = dbo.unwanted(REPLACE(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, '')+POINTER.DBO.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', ''))
--adding UPCID_CS_WP
update dbo.all_health_upcid
set upcid_cs_wp = dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'letters') + ISNULL(POSTCODE, ''), ' ', ''))
--adding UPCID_CS_NP
update dbo.all_health_upcid
set upcid_cs_np = dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'letters')+POINTER.DBO.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', ''))
--adding UPCID_N_NVD_WP
update dbo.all_health_upcid
set upcid_n_nvd_wp = dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'numbers')+CENSUS2011.DBO.nvd(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, '')) +ISNULL(POSTCODE, ''), ' ', ''))
--adding UPCID_N_NVD_NP
update dbo.all_health_upcid
set upcid_n_nvd_np = dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'numbers')+CENSUS2011.DBO.nvd(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, '')) +POINTER.DBO.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', ''))
--adding UPCID_NVD_WP
update dbo.all_health_upcid
set upcid_nvd_wp = dbo.unwanted(REPLACE(CENSUS2011.DBO.nvd(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, '')) +ISNULL(POSTCODE, ''), ' ', ''))
--adding UPCID_NVD_NP
update dbo.all_health_upcid
set upcid_nvd_np = dbo.unwanted(REPLACE(CENSUS2011.DBO.nvd(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, '')) +POINTER.DBO.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', ''))
--adding UPCID_N_FC_WP
update dbo.all_health_upcid
set upcid_n_fc_wp = dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'numbers')+LEFT(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'letters'), 1)+ISNULL(POSTCODE, ''), ' ', ''))
--adding UPCID_N_FC_NP
update dbo.all_health_upcid
set upcid_n_fc_np = dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'numbers')+LEFT(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'letters'), 1)+POINTER.DBO.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', ''))
--adding UPCID_N_3C_WP
update dbo.all_health_upcid
set upcid_n_3c_wp = dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'numbers')+LEFT(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'letters'), 3)+ISNULL(POSTCODE, ''), ' ', ''))
--adding UPCID_N_3C_NP
update dbo.all_health_upcid
set upcid_n_3c_np = dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'numbers')+LEFT(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'letters'), 3)+POINTER.DBO.fn_extract_chars(ISNULL(POSTCODE, ''), 'numbers'), ' ', ''))
--*********************JOINS****************************
--UPCID_N_WP (556459) (82%) (5 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_WP = p.UPCID_N_WP
group by ah.healthid
having count(*) = 1
--UPCID_N_NP (13251) (2%) (3 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_NP = p.UPCID_N_NP
group by ah.healthid
having count(*) = 1
--UPCID_WS_WP (3971) (0.6%) (1 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_WS_WP = p.UPCID_WS_WP
group by ah.healthid
having count(*) = 1
--UPCID_WS_NP (4034) (0.6%) (1 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_WS_NP = p.UPCID_WS_NP
group by ah.healthid
having count(*) = 1
--UPCID_CS_WP (70) (0.01%) (1 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_CS_WP = p.UPCID_CS_WP
group by ah.healthid
having count(*) = 1
--UPCID_CS_NP (52) (0.01%) (4 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_CS_NP = p.UPCID_CS_NP
group by ah.healthid
having count(*) = 1
--UPCID_N_NVD_WP (3934) (0.58%) (1 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_NVD_WP = p.UPCID_N_NVD_WP
group by ah.healthid
having count(*) = 1
--UPCID_N_NVD_NP (4000) (0.59%) (1 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_NVD_NP = p.UPCID_N_NVD_NP
group by ah.healthid
having count(*) = 1
--UPCID_NVD_WP (6) (%) (1 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_NVD_WP = p.UPCID_NVD_WP
group by ah.healthid
having count(*) = 1
--UPCID_NVD_NP (7) (%) (1 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_NVD_NP = p.UPCID_NVD_NP
group by ah.healthid
having count(*) = 1
--UPCID_N_FC_WP (577865) (85%) (3 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_FC_WP = p.UPCID_N_FC_WP
group by ah.healthid
having count(*) = 1
--UPCID_N_FC_NP (116044) (17%) (3 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_FC_NP = p.UPCID_N_FC_NP
group by ah.healthid
having count(*) = 1
--UPCID_N_3C_WP (577282) (85%) (4 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_3C_WP = p.UPCID_N_3C_WP
group by ah.healthid
having count(*) = 1
--UPCID_N_3C_NP (330640) (49%) (3 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_3C_NP = p.UPCID_N_3C_NP
group by ah.healthid
having count(*) = 1
--records with uprn
select count(*)from all_health_upcid where uprn is not null
--best join where the uprn is null (5596) (2 seconds)
select ah.healthid, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_FC_WP = p.UPCID_N_FC_WP
where ah.uprn is null
group by ah.healthid
having count(*) = 1
--joining on multiple fields (9873) (7 seconds)
select ah.healthid, count(*)--UPCID_N_FC_WP
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_FC_WP = p.UPCID_N_FC_WP
where ah.uprn is null
group by ah.healthid
having count(*) = 1
union
select ah.healthid, count(*)--UPCID_N_3C_WP
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_3C_WP = p.UPCID_N_3C_WP
where ah.uprn is null
group by ah.healthid
having count(*) = 1
union
select ah.healthid, count(*)--UPCID_N_WP
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_WP = p.UPCID_N_WP
where ah.uprn is null
group by ah.healthid
having count(*) = 1
union
select ah.healthid, count(*)--UPCID_FL_N_WP
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_FL_N_WP = p.UPCID_FL_N_WP
where ah.uprn is null
group by ah.healthid
having count(*) = 1

select * from all_health_upcid where address1 like '%flat%' and uprn is null

select * from all_health_upcid where address2 like '%flat%' and uprn is null

select * from pointer.dbo.pointer_upcid where uprn = '185511423'

select * from pointer.dbo.pointer_upcid where sub_building_name like '%flat%'
--adding UPCID_FL_N_WP to pointer
alter table pointer.dbo.pointer_upcid
add UPCID_FL_N_WP varchar(128)
--
update pointer.dbo.pointer_upcid
set UPCID_FL_N_WP = REPLACE(ISNULL(sub_building_name, '')+pointer.dbo.fn_extract_chars(ISNULL(BUILDING_NAME, '')+ISNULL(BUILDING_NUMBER, '')+ISNULL(PRIMARY_THORFARE, '')+ISNULL(ALT_THORFARE_NAME1, '')+ISNULL(SECONDARY_THORFARE, ''), 'numbers')+ISNULL(POSTCODE, ''), ' ', '')
where sub_building_name like '%flat%'
--adding UPCID_FL_N_WP to all_health_upcid
alter table all_health_upcid
add UPCID_FL_N_WP varchar(128)
--
update all_health_upcid
set UPCID_FL_N_WP = 'FLAT'+REPLACE(pointer.dbo.fn_extract_chars(ISNULL(ADDRESS1, '')+ISNULL(ADDRESS2, '')+ISNULL(ADDRESS3, '')+ISNULL(ADDRESS4, ''), 'numbers')+ISNULL(POSTCODE, ''), ' ', '')
where address1 like '%flat%' or address2 like '%flat%'
--adding UPRN fields for the UPCIDS in the health table
alter table all_health_upcid
add UPRN_N_WP varchar(128), UPRN_N_NP varchar(128), UPRN_WS_WP varchar(128), UPRN_WS_NP varchar(128), UPRN_CS_WP varchar(128), UPRN_CS_NP varchar(128), UPRN_N_NVD_WP varchar(128), UPRN_N_NVD_NP varchar(128), UPRN_NVD_WP varchar(128), UPRN_NVD_NP varchar(128), UPRN_N_FC_WP varchar(128), UPRN_N_FC_NP varchar(128), UPRN_N_3C_WP varchar(128), UPRN_N_3C_NP varchar(128), UPRN_FL_N_WP varchar(128)
--UPRN_N_WP
select ah.healthid, ah.uprn, count(*)
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_WP = p.UPCID_N_WP
group by ah.healthid, ah.uprn
having count(*) = 1
--
update all_health_upcid
set UPRN_N_WP = null
--working update UPRN_N_WP
update ah
set ah.UPRN_N_WP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_WP = p.UPCID_N_WP
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--testing update --UPRN_N_WP
select UPRN, UPRN_N_WP
from all_health_upcid
where uprn <> uprn_n_wp or (uprn is null and uprn_n_wp is not null)
--
select UPRN, UPRN_N_WP
from all_health_upcid
where uprn is null and uprn_n_wp is not null
--UPRN_N_NP
update ah
set ah.UPRN_N_NP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_NP = p.UPCID_N_NP
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--UPRN_WS_WP
update ah
set ah.UPRN_WS_WP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_WS_WP = p.UPCID_WS_WP
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--UPRN_WS_NP
update ah
set ah.UPRN_WS_NP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_WS_NP = p.UPCID_WS_NP
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--UPRN_CS_WP
update ah
set ah.UPRN_CS_WP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_CS_WP = p.UPCID_CS_WP
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--UPRN_CS_NP
update ah
set ah.UPRN_CS_NP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_CS_NP = p.UPCID_CS_NP
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--UPRN_N_NVD_WP
update ah
set ah.UPRN_N_NVD_WP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_NVD_WP = p.UPCID_N_NVD_WP
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--UPRN_N_NVD_NP
update ah
set ah.UPRN_N_NVD_NP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_NVD_NP = p.UPCID_N_NVD_NP
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--UPRN_NVD_WP
update ah
set ah.UPRN_NVD_WP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_NVD_WP = p.UPCID_NVD_WP
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--UPRN_NVD_NP
update ah
set ah.UPRN_NVD_NP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_NVD_NP = p.UPCID_NVD_NP
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--UPRN_N_FC_WP
update ah
set ah.UPRN_N_FC_WP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_FC_WP = p.UPCID_N_FC_WP
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--UPRN_N_FC_NP
update ah
set ah.UPRN_N_FC_NP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_FC_NP = p.UPCID_N_FC_NP
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--UPRN_N_3C_WP
update ah
set ah.UPRN_N_3C_WP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_3C_WP = p.UPCID_N_3C_WP
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--UPRN_N_3C_NP
update ah
set ah.UPRN_N_3C_NP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_3C_NP = p.UPCID_N_3C_NP
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--UPRN_FL_N_WP
update ah
set ah.UPRN_FL_N_WP = p.uprn
from all_health_upcid ah
inner join (select ah.healthid as healthid, p.uprn as uprn, count(*) as thecount
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_FL_N_WP = p.UPCID_FL_N_WP
where ah.UPCID_FL_N_WP is not null
group by ah.healthid, p.uprn
having count(*) = 1) as p
on p.healthid = ah.healthid
--how many records in all_health_upcid (680471)
select count(*) from all_health_upcid
--how many none null health UPRNs (637184) 93%
select count(*) from all_health_upcid where uprn is not null
--how many records none null uprn_n_wp (614952) 90%
select count(*) from all_health_upcid where uprn_n_wp is not null
--how many records have same uprn for health and upcid uprn (567089) 83%
select count(*) from all_health_upcid where uprn = uprn_n_wp and uprn is not null and uprn_n_wp is not null		
--how many records have qa uprn and not upcid (37393) 5% 
select count(*) from all_health_upcid where uprn is not null and uprn_n_wp is null
--how many records have upcid uprn and not qa (15161) 2%
select count(*) from all_health_upcid where uprn is null and uprn_n_wp is not null
--how many records have a different uprn from upcid uprn (32702) 5%
select count(*) from all_health_upcid where uprn <> uprn_n_wp
--how many null qa uprn (43287)
select count(*) from all_health_upcid where uprn is null
--how many null upcid uprn (65519)
select count(*) from all_health_upcid where uprn_n_wp is null
--case statement for all of the above--UPCID_N_WP
select
sum(case when uprn_n_wp is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_n_wp and uprn is not null and uprn_n_wp is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_n_wp is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_n_wp then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_n_wp is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--case statement for all of the above--UPCID_N_NP
select
sum(case when uprn_n_np is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_n_np and uprn is not null and uprn_n_np is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_n_np is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_n_np then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_n_np is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--case statement for all of the above--UPCID_WS_WP
select
sum(case when uprn_ws_wp is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_ws_wp and uprn is not null and uprn_ws_wp is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_ws_wp is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_ws_wp then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_ws_wp is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--case statement for all of the above--UPCID_WS_NP
select
sum(case when uprn_ws_np is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_ws_np and uprn is not null and uprn_ws_np is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_ws_np is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_ws_np then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_ws_np is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--case statement for all of the above--UPCID_CS_WP
select
sum(case when uprn_cs_wp is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_cs_wp and uprn is not null and uprn_cs_wp is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_cs_wp is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_cs_wp then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_cs_wp is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--case statement for all of the above--UPCID_CS_NP
select
sum(case when uprn_cs_np is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_cs_np and uprn is not null and uprn_cs_np is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_cs_np is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_cs_np then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_cs_np is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--case statement for all of the above--UPCID_N_NVD_WP
select
sum(case when uprn_n_nvd_wp is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_n_nvd_wp and uprn is not null and uprn_n_nvd_wp is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_n_nvd_wp is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_n_nvd_wp then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_n_nvd_wp is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--case statement for all of the above--UPCID_N_NVD_NP
select
sum(case when uprn_n_nvd_np is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_n_nvd_np and uprn is not null and uprn_n_nvd_np is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_n_nvd_np is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_n_nvd_np then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_n_nvd_np is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--case statement for all of the above--UPCID_NVD_WP
select
sum(case when uprn_nvd_wp is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_nvd_wp and uprn is not null and uprn_nvd_wp is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_nvd_wp is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_nvd_wp then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_nvd_wp is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--case statement for all of the above--UPCID_NVD_NP
select
sum(case when uprn_nvd_np_ is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_nvd_np and uprn is not null and uprn_nvd_np is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_nvd_np is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_nvd_np then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_nvd_np is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--case statement for all of the above--UPCID_N_FC_WP
select
sum(case when uprn_n_fc_wp is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_n_fc_wp and uprn is not null and uprn_n_fc_wp is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_n_fc_wp is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_n_fc_wp then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_n_fc_wp is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--case statement for all of the above--UPCID_N_FC_NP
select
sum(case when uprn_n_fc_np is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_n_fc_np and uprn is not null and uprn_n_fc_np is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_n_fc_np is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_n_fc_np then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_n_fc_np is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--case statement for all of the above--UPCID_N_3C_WP
select
sum(case when uprn_n_3c_wp is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_n_3c_wp and uprn is not null and uprn_n_3c_wp is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_n_3c_wp is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_n_3c_wp then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_n_3c_wp is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--case statement for all of the above--UPCID_N_3C_NP
select
sum(case when uprn_n_3c_np_2 is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_n_3c_np_2 and uprn is not null and uprn_n_3c_np_2 is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_n_3c_np_2 is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_n_3c_np_2 then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_n_3c_np_2 is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--case statement for all of the above--UPCID_FL_N_WP
select
sum(case when uprn_fl_n_wp_2 is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_fl_n_wp_2 and uprn is not null and uprn_fl_n_wp_2 is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_fl_n_wp_2 is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_fl_n_wp_2 then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_fl_n_wp_2 is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--fixing pointer_upcid table as there are duplicates
--counting records
select count(*) from pointer.dbo.pointer_upcid
--counting records
select count(*) from pointer.dbo.pointer_upcid_new
--testing for duplicates
select uprn, count(*) from pointer.dbo.pointer_upcid_new group by uprn having count(*) > 1
--adding to new table
select SUB_BUILDING_NAME, BUILDING_NAME, BUILDING_NUMBER, PRIMARY_THORFARE, ALT_THORFARE_NAME1, SECONDARY_THORFARE, LOCALITY, TOWNLAND, TOWN, COUNTY, POSTCODE, BLPU, UNIQUE_BUILDING_ID, UPRN, UPCID_N_WP, UPCID_N_NP, UPCID_WS_WP, UPCID_WS_NP, UPCID_CS_WP, UPCID_CS_NP, UPCID_N_NVD_WP, UPCID_N_NVD_NP, UPCID_NVD_WP, UPCID_NVD_NP, UPCID_N_FC_WP, UPCID_N_FC_NP, UPCID_N_3C_WP, UPCID_N_3C_NP, UPCID_FL_N_WP, count(*) as temp 
into pointer.dbo.pointer_upcid_new 
from pointer.dbo.pointer_upcid 
group by SUB_BUILDING_NAME, BUILDING_NAME, BUILDING_NUMBER, PRIMARY_THORFARE, ALT_THORFARE_NAME1, SECONDARY_THORFARE, LOCALITY, TOWNLAND, TOWN, COUNTY, POSTCODE, BLPU, UNIQUE_BUILDING_ID, UPRN, UPCID_N_WP, UPCID_N_NP, UPCID_WS_WP, UPCID_WS_NP, UPCID_CS_WP, UPCID_CS_NP, UPCID_N_NVD_WP, UPCID_N_NVD_NP, UPCID_NVD_WP, UPCID_NVD_NP, UPCID_N_FC_WP, UPCID_N_FC_NP, UPCID_N_3C_WP, UPCID_N_3C_NP, UPCID_FL_N_WP 
having count(*) > 1
--adding to new table
select SUB_BUILDING_NAME, BUILDING_NAME, BUILDING_NUMBER, PRIMARY_THORFARE, ALT_THORFARE_NAME1, SECONDARY_THORFARE, LOCALITY, TOWNLAND, TOWN, COUNTY, POSTCODE, BLPU, UNIQUE_BUILDING_ID, UPRN, UPCID_N_WP, UPCID_N_NP, UPCID_WS_WP, UPCID_WS_NP, UPCID_CS_WP, UPCID_CS_NP, UPCID_N_NVD_WP, UPCID_N_NVD_NP, UPCID_NVD_WP, UPCID_NVD_NP, UPCID_N_FC_WP, UPCID_N_FC_NP, UPCID_N_3C_WP, UPCID_N_3C_NP, UPCID_FL_N_WP, count(*) as temp 
into pointer.dbo.pointer_upcid_new 
from pointer.dbo.pointer_upcid 
group by SUB_BUILDING_NAME, BUILDING_NAME, BUILDING_NUMBER, PRIMARY_THORFARE, ALT_THORFARE_NAME1, SECONDARY_THORFARE, LOCALITY, TOWNLAND, TOWN, COUNTY, POSTCODE, BLPU, UNIQUE_BUILDING_ID, UPRN, UPCID_N_WP, UPCID_N_NP, UPCID_WS_WP, UPCID_WS_NP, UPCID_CS_WP, UPCID_CS_NP, UPCID_N_NVD_WP, UPCID_N_NVD_NP, UPCID_NVD_WP, UPCID_NVD_NP, UPCID_N_FC_WP, UPCID_N_FC_NP, UPCID_N_3C_WP, UPCID_N_3C_NP, UPCID_FL_N_WP 
having count(*) = 1
--different statement for insert
insert into pointer.dbo.pointer_upcid_new (SUB_BUILDING_NAME, BUILDING_NAME, BUILDING_NUMBER, PRIMARY_THORFARE, ALT_THORFARE_NAME1, SECONDARY_THORFARE, LOCALITY, TOWNLAND, TOWN, COUNTY, POSTCODE, BLPU, UNIQUE_BUILDING_ID, UPRN, UPCID_N_WP, UPCID_N_NP, UPCID_WS_WP, UPCID_WS_NP, UPCID_CS_WP, UPCID_CS_NP, UPCID_N_NVD_WP, UPCID_N_NVD_NP, UPCID_NVD_WP, UPCID_NVD_NP, UPCID_N_FC_WP, UPCID_N_FC_NP, UPCID_N_3C_WP, UPCID_N_3C_NP, UPCID_FL_N_WP, temp)
select SUB_BUILDING_NAME, BUILDING_NAME, BUILDING_NUMBER, PRIMARY_THORFARE, ALT_THORFARE_NAME1, SECONDARY_THORFARE, LOCALITY, TOWNLAND, TOWN, COUNTY, POSTCODE, BLPU, UNIQUE_BUILDING_ID, UPRN, UPCID_N_WP, UPCID_N_NP, UPCID_WS_WP, UPCID_WS_NP, UPCID_CS_WP, UPCID_CS_NP, UPCID_N_NVD_WP, UPCID_N_NVD_NP, UPCID_NVD_WP, UPCID_NVD_NP, UPCID_N_FC_WP, UPCID_N_FC_NP, UPCID_N_3C_WP, UPCID_N_3C_NP, UPCID_FL_N_WP, count(*)
from pointer.dbo.pointer_upcid
group by SUB_BUILDING_NAME, BUILDING_NAME, BUILDING_NUMBER, PRIMARY_THORFARE, ALT_THORFARE_NAME1, SECONDARY_THORFARE, LOCALITY, TOWNLAND, TOWN, COUNTY, POSTCODE, BLPU, UNIQUE_BUILDING_ID, UPRN, UPCID_N_WP, UPCID_N_NP, UPCID_WS_WP, UPCID_WS_NP, UPCID_CS_WP, UPCID_CS_NP, UPCID_N_NVD_WP, UPCID_N_NVD_NP, UPCID_NVD_WP, UPCID_NVD_NP, UPCID_N_FC_WP, UPCID_N_FC_NP, UPCID_N_3C_WP, UPCID_N_3C_NP, UPCID_FL_N_WP
having count(*) = 1
--getting unique health ids where upcid_n_wp matches and putting into temp table
select ah.healthid as healthid, count(*) as thecount
into #tempHealthUnique
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_WP = p.UPCID_N_WP
group by ah.healthid
having count(*) = 1
order by healthid
--getting all the details of all unique health ids and putting into temp  table
select HEALTH_AUTOID, ah.HEALTHID, FORENAME, MIDNAME, SURNAME, DOB, ADDRESS1, ADDRESS2, ADDRESS3, ADDRESS4, POSTCODE, UPCID_N_WP, UPCID_N_NP, UPCID_WS_WP, UPCID_WS_NP, UPCID_CS_WP, UPCID_CS_NP, UPCID_N_NVD_WP, UPCID_N_NVD_NP, UPCID_NVD_WP, UPCID_NVD_NP, UPCID_N_FC_WP, UPCID_N_FC_NP, UPCID_N_3C_WP, UPCID_N_3C_NP, UPCID_FL_N_WP, UPRN, UPRN_N_WP, UPRN_N_NP, UPRN_WS_WP, UPRN_WS_NP, UPRN_CS_WP, UPRN_CS_NP, UPRN_N_NVD_WP, UPRN_N_NVD_NP, UPRN_NVD_WP, UPRN_NVD_NP, UPRN_N_FC_WP, UPRN_N_FC_NP, UPRN_N_3C_WP, UPRN_N_3C_NP, UPRN_FL_N_WP
into #tempHealth
from health.dbo.all_health_upcid ah
inner join #tempHealthUnique thu
on ah.healthid = thu.healthid
--counting records in temps
select count(*) from #tempHealthUnique

select count(*) from #tempHealth
--adding uprn_n_wp into temp table where matching
update #tempHealth
set #tempHealth.uprn_n_wp = p.uprn
from pointer.dbo.pointer_upcid p
where #tempHealth.upcid_n_wp = p.upcid_n_wp
--checking for dups matches and nulls
select * from #tempHealth y
inner join(
select * from #tempHealth
) as x
on y.healthid = x.healthid
where y.uprn <> x.uprn_n_wp

select * from #tempHealth y
inner join(
select * from #tempHealth
) as x
on y.healthid = x.healthid
where y.uprn = x.uprn_n_wp

select * from #tempHealth y
inner join(
select * from #tempHealth
) as x
on y.healthid = x.healthid
where y.uprn is null or x.uprn_n_wp is null
--updating health table with new data
update health.dbo.all_health_upcid
set health.dbo.all_health_upcid.uprn_n_wp = th.uprn_n_wp
from #tempHealth th
where health.dbo.all_health_upcid.healthid = th.healthid
--checking for dups, matches and nulls
select count(*) from health.dbo.all_health_upcid y
inner join(
select * from health.dbo.all_health_upcid
) as x
on y.healthid = x.healthid
where y.uprn <> x.uprn_n_wp

select count(*) from health.dbo.all_health_upcid y
inner join(
select * from health.dbo.all_health_upcid
) as x
on y.healthid = x.healthid
where y.uprn = x.uprn_n_wp

select count(*) from health.dbo.all_health_upcid y
inner join(
select * from health.dbo.all_health_upcid
) as x
on y.healthid = x.healthid
where y.uprn is null or x.uprn_n_wp is null
--counting records in health table
select count(*) from health.dbo.all_health_upcid

select count(*) from health.dbo.all_health_upcid where uprn_n_wp = '185715832'

select count(*) from health.dbo.all_health_upcid where uprn_n_wp is null or uprn_n_wp = ''

drop table #tempHealthUnique

drop table #tempHealth
--fresh attempt
--creating temp pointer with health id
select ah.healthid, p.upcid_n_wp, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_WP = p.UPCID_N_WP

--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--
drop table #tempHealth

select top 1 * from #tempHealth
--
select * from #tempPointer where healthid = '3746140668'
--
update health.dbo.all_health_upcid
set uprn_n_wp = ''
--
update health.dbo.all_health_upcid
set health.dbo.all_health_upcid.uprn_n_wp = p.uprn
from

(select * 
from #tempPointer
where healthid in	
(select healthid
from #tempHealth)) as p
--
update ah
set ah.uprn_n_wp = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid

update health.dbo.all_health_upcid
set uprn_n_wp = null
where uprn_n_wp = ''

select count(*) from health.dbo.all_health_upcid where uprn_n_wp = ''


--updating uprn_n_np
--creating temp pointer with health id
select ah.healthid, p.upcid_n_np, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_NP = p.UPCID_N_NP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_n_np = null
--updating health table with temp data
update ah
set ah.uprn_n_np = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth


--updating uprn_ws_wp
--creating temp pointer with health id
select ah.healthid, p.upcid_ws_wp, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_WS_WP = p.UPCID_WS_WP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_ws_wp = null
--updating health table with temp data
update ah
set ah.uprn_ws_wp = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--updating uprn_ws_np
--creating temp pointer with health id
select ah.healthid, p.upcid_ws_np, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_WS_NP = p.UPCID_WS_NP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_ws_np = null
--updating health table with temp data
update ah
set ah.uprn_ws_np = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--updating uprn_cs_wp
--creating temp pointer with health id
select ah.healthid, p.upcid_cs_wp, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_CS_WP = p.UPCID_CS_WP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_cs_wp = null
--updating health table with temp data
update ah
set ah.uprn_cs_wp = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--updating uprn_cs_np
--creating temp pointer with health id
select ah.healthid, p.upcid_cs_np, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_CS_NP = p.UPCID_CS_NP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_cs_np = null
--updating health table with temp data
update ah
set ah.uprn_cs_np = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--updating uprn_n_nvd_wp
--creating temp pointer with health id
select ah.healthid, p.upcid_n_nvd_wp, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_NVD_WP = p.UPCID_N_NVD_WP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_n_nvd_wp = null
--updating health table with temp data
update ah
set ah.uprn_n_nvd_wp = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--updating uprn_n_nvd_np
--creating temp pointer with health id
select ah.healthid, p.upcid_n_nvd_np, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_NVD_NP = p.UPCID_N_NVD_NP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_n_nvd_np = null
--updating health table with temp data
update ah
set ah.uprn_n_nvd_np = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--updating uprn_nvd_wp
--creating temp pointer with health id
select ah.healthid, p.upcid_nvd_wp, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_NVD_WP = p.UPCID_NVD_WP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_nvd_wp = null
--updating health table with temp data
update ah
set ah.uprn_nvd_wp = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--updating uprn_nvd_np
--creating temp pointer with health id
select ah.healthid, p.upcid_nvd_np, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_NVD_NP = p.UPCID_NVD_NP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_nvd_np = null
--updating health table with temp data
update ah
set ah.uprn_nvd_np = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--updating uprn_n_fc_wp
--creating temp pointer with health id
select ah.healthid, p.upcid_n_fc_wp, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_FC_WP = p.UPCID_N_FC_WP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_n_fc_wp = null
--updating health table with temp data
update ah
set ah.uprn_n_fc_wp = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--updating uprn_n_fc_np
--creating temp pointer with health id
select ah.healthid, p.upcid_n_fc_np, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_FC_NP = p.UPCID_N_FC_NP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_n_fc_np = null
--updating health table with temp data
update ah
set ah.uprn_n_fc_np = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--updating uprn_n_3c_wp
--creating temp pointer with health id
select ah.healthid, p.upcid_n_3c_wp, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_3C_WP = p.UPCID_N_3C_WP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_n_3c_wp = null
--updating health table with temp data
update ah
set ah.uprn_n_3c_wp = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--updating uprn_n_3c_np
--creating temp pointer with health id
select ah.healthid, p.upcid_n_3c_np, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_3C_NP = p.UPCID_N_3C_NP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_n_3c_np = null
--updating health table with temp data
update ah
set ah.uprn_n_3c_np = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--updating uprn_fl_n_wp
--creating temp pointer with health id
select ah.healthid, p.upcid_fl_n_wp, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_FL_N_WP = p.UPCID_FL_N_WP
where ah.UPCID_FL_N_WP is not null
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_fl_n_wp = null
--updating health table with temp data
update ah
set ah.uprn_fl_n_wp = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--add UPCID_N_ST_WP
alter table all_health_upcid
add UPCID_N_ST_WP varchar(128)
--adding UPCID_N_ST_WP to all health
select healthid, case when Address1 is null 
	then dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(Address2, 'numbers') + POINTER.DBO.fn_extract_chars(Address2, 'letters') + ISNULL(POSTCODE, ''), ' ', ''))
	else dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(Address1, 'numbers') + POINTER.DBO.fn_extract_chars(Address1, 'letters') + ISNULL(POSTCODE, ''), ' ', '')) 
	end as UPCID_N_ST_WP
	into #tempUPCID_N_ST_WP
	from all_health_upcid

update ah
set ah.upcid_n_st_wp = #tempUPCID_N_ST_WP.upcid_n_st_wp
from dbo.all_health_upcid ah
inner join #tempUPCID_N_ST_WP
on ah.healthid = #tempUPCID_N_ST_WP.healthid
--adding UPCID_N_ST_WP
alter table pointer.dbo.pointer_upcid
add UPCID_N_ST_WP varchar(128)

drop table #tempUPCID_N_ST_WP

select uprn, case when primary_thorfare = ' '
	then dbo.unwanted(REPLACE(building_number + building_name + postcode, ' ', ''))
	else dbo.unwanted(REPLACE(building_number + primary_thorfare + postcode, ' ', ''))
	end as UPCID_N_ST_WP
	into #tempUPCID_N_ST_WP
	from pointer.dbo.pointer_upcid

update p
set p.upcid_n_st_wp = #tempUPCID_N_ST_WP.upcid_n_st_wp
from pointer.dbo.pointer_upcid p
inner join #tempUPCID_N_ST_WP
on p.uprn = #tempUPCID_N_ST_WP.uprn

drop table #tempUPCID_N_ST_WP
--adding uprn_n_st_wp
alter table all_health_upcid
add uprn_n_st_wp varchar(128)
--updating uprn_n_st_wp
--creating temp pointer with health id
select ah.healthid, p.upcid_n_st_wp, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_ST_WP = p.UPCID_N_ST_WP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set uprn_n_st_wp = null
--updating health table with temp data
update ah
set ah.uprn_n_st_wp = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--case statement for all of the above--UPCID_N_ST_WP
select
sum(case when uprn_n_st_wp is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_n_st_wp and uprn is not null and uprn_n_st_wp is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_n_st_wp is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_n_st_wp then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_n_st_wp is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--writting code to catch just the first part of postcode UPCID_N_ST_WP4
select postcode, postcode = 
	case when len(replace(postcode, ' ', '')) = 7
	then substring(replace(postcode, ' ', ''), 1, 4)
	when len(replace(postcode, ' ', '')) = 6
	then substring(replace(postcode, ' ', ''), 1, 3)
	else postcode  end, len(replace(postcode, ' ', ''))
from all_health_upcid
--add UPCID_N_ST_WP4
alter table all_health_upcid
add UPCID_N_ST_WP4 varchar(128)
--adding UPCID_N_ST_WP4 to all health
select healthid, case when Address1 is null 
	then dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(Address2, 'numbers') + POINTER.DBO.fn_extract_chars(Address2, 'letters') + ISNULL(case when len(replace(postcode, ' ', '')) = 7
																																			then substring(replace(postcode, ' ', ''), 1, 4)
																																			when len(replace(postcode, ' ', '')) = 6
																																			then substring(replace(postcode, ' ', ''), 1, 3)
																																			else replace(postcode, ' ', '')  end, ''), ' ', ''))
	else dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(Address1, 'numbers') + POINTER.DBO.fn_extract_chars(Address1, 'letters') + ISNULL(case when len(replace(postcode, ' ', '')) = 7
																																			then substring(replace(postcode, ' ', ''), 1, 4)
																																			when len(replace(postcode, ' ', '')) = 6
																																			then substring(replace(postcode, ' ', ''), 1, 3)
																																			else replace(postcode, ' ', '')  end, ''), ' ', '')) 
	end as UPCID_N_ST_WP4
	into #tempUPCID_N_ST_WP4
	from all_health_upcid

update ah
set ah.upcid_n_st_wp4 = #tempUPCID_N_ST_WP4.upcid_n_st_wp4
from dbo.all_health_upcid ah
inner join #tempUPCID_N_ST_WP4
on ah.healthid = #tempUPCID_N_ST_WP4.healthid
--adding UPCID_N_ST_WP4
alter table pointer.dbo.pointer_upcid
add UPCID_N_ST_WP4 varchar(128)

drop table #tempUPCID_N_ST_WP4

select uprn, case when primary_thorfare = ' '
	then dbo.unwanted(REPLACE(building_number + building_name + case when len(replace(postcode, ' ', '')) = 7
													then substring(replace(postcode, ' ', ''), 1, 4)
													when len(replace(postcode, ' ', '')) = 6
													then substring(replace(postcode, ' ', ''), 1, 3)
													else replace(postcode, ' ', '')  end, ' ', ''))
	else dbo.unwanted(REPLACE(building_number + primary_thorfare + case when len(replace(postcode, ' ', '')) = 7
														then substring(replace(postcode, ' ', ''), 1, 4)
														when len(replace(postcode, ' ', '')) = 6
														then substring(replace(postcode, ' ', ''), 1, 3)
														else replace(postcode, ' ', '')  end, ' ', ''))
	end as UPCID_N_ST_WP4
	into #tempUPCID_N_ST_WP4
	from pointer.dbo.pointer_upcid

update p
set p.upcid_n_st_wp4 = #tempUPCID_N_ST_WP4.upcid_n_st_wp4
from pointer.dbo.pointer_upcid p
inner join #tempUPCID_N_ST_WP4
on p.uprn = #tempUPCID_N_ST_WP4.uprn

drop table #tempUPCID_N_ST_WP4
--adding uprn_n_st_wp4
alter table all_health_upcid
add uprn_n_st_wp4 varchar(128)
--updating uprn_n_st_wp4
--creating temp pointer with health id
select ah.healthid, p.upcid_n_st_wp4, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_ST_WP4 = p.UPCID_N_ST_WP4
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set upcid_n_st_wp4 = null
update health.dbo.all_health_upcid
set uprn_n_st_wp4 = null
update pointer.dbo.pointer_upcid
set upcid_n_st_wp4 = null
--updating health table with temp data
update ah
set ah.uprn_n_st_wp4 = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--case statement for all of the above--UPCID_N_ST_WP4
select
sum(case when uprn_n_st_wp4 is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_n_st_wp4 and uprn is not null and uprn_n_st_wp4 is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_n_st_wp4 is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_n_st_wp4 then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_n_st_wp4 is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--add UPCID_N_ST_WP5
alter table all_health_upcid
add UPCID_N_ST_WP5 varchar(128)
--adding UPCID_N_ST_WP5 to all health
select healthid, case when Address1 is null 
	then dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(Address2, 'numbers') + POINTER.DBO.fn_extract_chars(Address2, 'letters') + ISNULL(case when len(replace(postcode, ' ', '')) = 7
																																			then substring(replace(postcode, ' ', ''), 1, 5)
																																			when len(replace(postcode, ' ', '')) = 6
																																			then substring(replace(postcode, ' ', ''), 1, 4)
																																			else replace(postcode, ' ', '')  end, ''), ' ', ''))
	else dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(Address1, 'numbers') + POINTER.DBO.fn_extract_chars(Address1, 'letters') + ISNULL(case when len(replace(postcode, ' ', '')) = 7
																																			then substring(replace(postcode, ' ', ''), 1, 5)
																																			when len(replace(postcode, ' ', '')) = 6
																																			then substring(replace(postcode, ' ', ''), 1, 4)
																																			else replace(postcode, ' ', '')  end, ''), ' ', ''))
	end as UPCID_N_ST_WP5
	into #tempUPCID_N_ST_WP5
	from all_health_upcid

update ah
set ah.upcid_n_st_wp5 = #tempUPCID_N_ST_WP5.upcid_n_st_wp5
from dbo.all_health_upcid ah
inner join #tempUPCID_N_ST_WP5
on ah.healthid = #tempUPCID_N_ST_WP5.healthid
--adding UPCID_N_ST_WP5
alter table pointer.dbo.pointer_upcid
add UPCID_N_ST_WP5 varchar(128)

drop table #tempUPCID_N_ST_WP5

select uprn, case when primary_thorfare = ' '
	then dbo.unwanted(REPLACE(building_number + building_name + case when len(replace(postcode, ' ', '')) = 7
													then substring(replace(postcode, ' ', ''), 1, 5)
													when len(replace(postcode, ' ', '')) = 6
													then substring(replace(postcode, ' ', ''), 1, 4)
													else replace(postcode, ' ', '')  end, ' ', ''))
	else dbo.unwanted(REPLACE(building_number + primary_thorfare + case when len(replace(postcode, ' ', '')) = 7
														then substring(replace(postcode, ' ', ''), 1, 5)
														when len(replace(postcode, ' ', '')) = 6
														then substring(replace(postcode, ' ', ''), 1, 4)
														else replace(postcode, ' ', '')  end, ' ', ''))
	end as UPCID_N_ST_WP5
	into #tempUPCID_N_ST_WP5
	from pointer.dbo.pointer_upcid

update p
set p.upcid_n_st_wp5 = #tempUPCID_N_ST_WP5.upcid_n_st_wp5
from pointer.dbo.pointer_upcid p
inner join #tempUPCID_N_ST_WP5
on p.uprn = #tempUPCID_N_ST_WP5.uprn

drop table #tempUPCID_N_ST_WP5
--adding uprn_n_st_wp5
alter table all_health_upcid
add uprn_n_st_wp5 varchar(128)
--updating uprn_n_st_wp5
--creating temp pointer with health id
select ah.healthid, p.upcid_n_st_wp5, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_ST_WP5 = p.UPCID_N_ST_WP5
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set upcid_n_st_wp5 = null
update health.dbo.all_health_upcid
set uprn_n_st_wp5 = null
update pointer.dbo.pointer_upcid
set upcid_n_st_wp5 = null
--updating health table with temp data
update ah
set ah.uprn_n_st_wp5 = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth


--case statement for all of the above--UPCID_N_ST_WP5
select
sum(case when uprn_n_st_wp5 is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_n_st_wp5 and uprn is not null and uprn_n_st_wp5 is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_n_st_wp5 is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_n_st_wp5 then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_n_st_wp5 is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid


--add UPCID_N_ST_WP6
alter table all_health_upcid
add UPCID_N_ST_WP6 varchar(128)
--adding UPCID_N_ST_WP6 to all health
select healthid, case when Address1 is null 
	then dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(Address2, 'numbers') + POINTER.DBO.fn_extract_chars(Address2, 'letters') + ISNULL(case when len(replace(postcode, ' ', '')) = 7
																																			then substring(replace(postcode, ' ', ''), 1, 6)
																																			when len(replace(postcode, ' ', '')) = 6
																																			then substring(replace(postcode, ' ', ''), 1, 5)
																																			else replace(postcode, ' ', '')  end, ''), ' ', ''))
	else dbo.unwanted(REPLACE(POINTER.DBO.fn_extract_chars(Address1, 'numbers') + POINTER.DBO.fn_extract_chars(Address1, 'letters') + ISNULL(case when len(replace(postcode, ' ', '')) = 7
																																			then substring(replace(postcode, ' ', ''), 1, 6)
																																			when len(replace(postcode, ' ', '')) = 6
																																			then substring(replace(postcode, ' ', ''), 1, 5)
																																			else replace(postcode, ' ', '')  end, ''), ' ', ''))
	end as UPCID_N_ST_WP6
	into #tempUPCID_N_ST_WP6
	from all_health_upcid

update ah
set ah.upcid_n_st_wp6 = #tempUPCID_N_ST_WP6.upcid_n_st_wp6
from dbo.all_health_upcid ah
inner join #tempUPCID_N_ST_WP6
on ah.healthid = #tempUPCID_N_ST_WP6.healthid
--adding UPCID_N_ST_WP6
alter table pointer.dbo.pointer_upcid
add UPCID_N_ST_WP6 varchar(128)

drop table #tempUPCID_N_ST_WP6

select uprn, case when primary_thorfare = ' '
	then dbo.unwanted(REPLACE(building_number + building_name + case when len(replace(postcode, ' ', '')) = 7
													then substring(replace(postcode, ' ', ''), 1, 6)
													when len(replace(postcode, ' ', '')) = 6
													then substring(replace(postcode, ' ', ''), 1, 5)
													else replace(postcode, ' ', '') end, ' ', ''))
	else dbo.unwanted(REPLACE(building_number + primary_thorfare + case when len(replace(postcode, ' ', '')) = 7
														then substring(replace(postcode, ' ', ''), 1, 6)
														when len(replace(postcode, ' ', '')) = 6
														then substring(replace(postcode, ' ', ''), 1, 5)
														else replace(postcode, ' ', '') end, ' ', ''))
	end as UPCID_N_ST_WP6
	into #tempUPCID_N_ST_WP6
	from pointer.dbo.pointer_upcid

update p
set p.upcid_n_st_wp6 = #tempUPCID_N_ST_WP6.upcid_n_st_wp6
from pointer.dbo.pointer_upcid p
inner join #tempUPCID_N_ST_WP6
on p.uprn = #tempUPCID_N_ST_WP6.uprn

drop table #tempUPCID_N_ST_WP6
--adding uprn_n_st_wp6
alter table all_health_upcid
add uprn_n_st_wp6 varchar(128)
--updating uprn_n_st_wp6
--creating temp pointer with health id
select ah.healthid, p.upcid_n_st_wp6, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_ST_WP6 = p.UPCID_N_ST_WP6
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set upcid_n_st_wp5 = null
update health.dbo.all_health_upcid
set uprn_n_st_wp5 = null
update pointer.dbo.pointer_upcid
set upcid_n_st_wp5 = null
--updating health table with temp data
update ah
set ah.uprn_n_st_wp6 = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--case statement for all of the above--UPCID_N_ST_WP6
select
sum(case when uprn_n_st_wp6 is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_n_st_wp6 and uprn is not null and uprn_n_st_wp6 is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_n_st_wp6 is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_n_st_wp6 then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_n_st_wp6 is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid
--
update pointer.dbo.pointer_upcid
set upcid_n_st_wp6 = null

select HEALTH_AUTOID, FORENAME, SURNAME, ADDRESS1, ADDRESS2, ADDRESS3, ADDRESS4, POSTCODE, UPCID_N_ST_WP, UPRN_N_ST_WP, UPCID_N_ST_WP4, uprn_n_st_wp4, UPCID_N_ST_WP5, uprn_n_st_wp5, UPCID_N_ST_WP6, uprn_n_st_wp6
from all_health_upcid

select SUB_BUILDING_NAME, BUILDING_NAME, BUILDING_NUMBER, PRIMARY_THORFARE, ALT_THORFARE_NAME1, SECONDARY_THORFARE, POSTCODE, UPCID_N_ST_WP, UPCID_N_ST_WP4, UPCID_N_ST_WP5, UPCID_N_ST_WP6
from pointer.dbo.pointer_upcid
--Ordering UPCIDs Attempt 1
select
--1-UPCID_N_FC_WP
sum(case when uprn_n_fc_wp is not null then 1 else 0 end) as UPCID_N_FC_WP,
--2-UPCID_N_3C_WP
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is not null then 1 else 0 end) as UPCID_N_3C_WP,
--3-UPCID_N_WP
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is null and uprn_n_wp is not null then 1 else 0 end) as UPCID_N_WP,
--4-UPCID_N_ST_WP6
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is not null then 1 else 0 end) as UPCID_N_ST_WP6,
--5-UPCID_N_ST_WP5
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_st_wp5 is not null then 1 else 0 end) as UPCID_N_ST_WP5,
--6-UPCID_N_ST_WP
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_st_wp5 is null and uprn_n_st_wp is not null then 1 else 0 end) as UPCID_N_ST_WP,
--7-UPCID_N_ST_WP4
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_st_wp5 is null and uprn_n_st_wp is null and uprn_n_st_wp4 is not null then 1 else 0 end) as UPCID_N_ST_WP4,
--no matches
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_st_wp5 is null and uprn_n_st_wp is null and uprn_n_st_wp4 is null then 1 else 0 end) as no_matches
from all_health_upcid

--Ordering UPCIDs Attempt 2
select
--1-UPCID_N_FC_WP
sum(case when uprn_n_fc_wp is not null then 1 else 0 end) as UPCID_N_FC_WP,
--2-UPCID_N_WP
sum(case when uprn_n_fc_wp is null and uprn_n_wp is not null then 1 else 0 end) as UPCID_N_WP,
--3-UPCID_N_ST_WP6
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is not null then 1 else 0 end) as UPCID_N_ST_WP6,
--4-UPCID_N_3C_WP
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_3c_wp is not null then 1 else 0 end) as UPCID_N_3C_WP,
--5-UPCID_N_ST_WP
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_3c_wp is null and uprn_n_st_wp is not null then 1 else 0 end) as UPCID_N_ST_WP,
--6-UPCID_N_ST_WP4
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_3c_wp is null and uprn_n_st_wp is null and uprn_n_st_wp4 is not null then 1 else 0 end) as UPCID_N_ST_WP4,
--7-UPCID_N_ST_WP5
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_3c_wp is null and uprn_n_st_wp is null and uprn_n_st_wp4 is null and uprn_n_st_wp5 is not null then 1 else 0 end) as UPCID_N_ST_WP5,
--no matches
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_3c_wp is null and uprn_n_st_wp is null and uprn_n_st_wp4 is null and uprn_n_st_wp5 is null then 1 else 0 end) as no_matches
from all_health_upcid

--Ordering UPCIDs Attempt 3
select
--1-UPCID_N_FC_WP
sum(case when uprn_n_fc_wp is not null then 1 else 0 end) as UPCID_N_FC_WP,
--2-UPCID_N_WP
sum(case when uprn_n_fc_wp is null and uprn_n_wp is not null then 1 else 0 end) as UPCID_N_WP,
--3-UPCID_N_ST_WP6
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is not null then 1 else 0 end) as UPCID_N_ST_WP6,
--4-UPCID_N_3C_WP
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_3c_wp is not null then 1 else 0 end) as UPCID_N_3C_WP,
--5-UPCID_N_ST_WP
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_3c_wp is null and uprn_n_st_wp is not null then 1 else 0 end) as UPCID_N_ST_WP,
--6-UPCID_N_ST_WP4
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_3c_wp is null and uprn_n_st_wp is null and uprn_n_st_wp4 is not null then 1 else 0 end) as UPCID_N_ST_WP4,
--7-UPCID_N_3C_NP
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_3c_wp is null and uprn_n_st_wp is null and uprn_n_st_wp4 is null and uprn_n_3c_np is not null then 1 else 0 end) as UPCID_N_3C_NP,
--8-UPCID_N_FC_NP
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_3c_wp is null and uprn_n_st_wp is null and uprn_n_st_wp4 is null and uprn_n_3c_np is null and uprn_n_fc_np is not null then 1 else 0 end) as UPCID_N_FC_NP,
--9-UPCID_N_NP
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_3c_wp is null and uprn_n_st_wp is null and uprn_n_st_wp4 is null and uprn_n_3c_np is null and uprn_n_fc_np is null and uprn_n_np is not null then 1 else 0 end) as UPCID_N_NP,
--no matches
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_3c_wp is null and uprn_n_st_wp is null and uprn_n_st_wp4 is null and uprn_n_3c_np is null and uprn_n_fc_np is null then 1 else 0 end) as no_matches
from all_health_upcid

--Ordering UPCIDs Attempt 4
select
--1-UPCID_N_FC_WP
sum(case when uprn_n_fc_wp is not null then 1 else 0 end) as UPCID_N_FC_WP,
--2-UPCID_N_3C_WP
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is not null then 1 else 0 end) as UPCID_N_3C_WP,
--3-UPCID_N_WP
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is null and uprn_n_wp is not null then 1 else 0 end) as UPCID_N_WP,
--4-UPCID_N_ST_WP6
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is not null then 1 else 0 end) as UPCID_N_ST_WP6,
--5-UPCID_N_ST_WP4
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_st_wp4 is not null then 1 else 0 end) as UPCID_N_ST_WP4,
--6-UPCID_N_3C_NP
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_st_wp4 is null and uprn_n_3c_np is not null then 1 else 0 end) as UPCID_N_3C_NP,
--7-UPCID_N_FC_NP
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_st_wp4 is null and uprn_n_3c_np is null and uprn_n_fc_np is not null then 1 else 0 end) as UPCID_N_FC_NP,
--8-UPCID_N_NP
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_st_wp4 is null and uprn_n_3c_np is null and uprn_n_fc_np is null and uprn_n_np is not null then 1 else 0 end) as UPCID_N_NP,
--no matches
sum(case when uprn_n_fc_wp is null and uprn_n_3c_wp is null and uprn_n_wp is null and uprn_n_st_wp6 is null and uprn_n_st_wp4 is null and uprn_n_3c_np is null and uprn_n_fc_np is null and uprn_n_np is null and uprn_ws_np is null then 1 else 0 end) as no_matches
from all_health_upcid

select
sum(case when uprn_n_fc_wp is null and uprn_n_wp is null and uprn_n_3c_np is null and uprn_n_fc_np is null and uprn_n_st_wp4 is null and uprn_n_np is null and uprn_n_3c_wp is null and uprn_n_st_wp6 is null and uprn_ws_np is not null then 1 else 0 end) as first
from all_health_upcid

select
sum(case when uprn_n_st_wp5 is null or uprn_n_st_wp5 = '' then 1 else 0 end) as first
from all_health_upcid

select
sum(case when uprn_n_fc_wp is null and 
uprn_n_wp is null and uprn_n_3c_np is null and 
uprn_wal is null and uprn_n_fc_np is null and
uprn_n_st_wp4 is null and uprn_n_np is null and
uprn_n_3c_wp is null and uprn_n_st_wp6 is null and
uprn_n_st_wp5 is null and uprn_fl_n_wp is null and
uprn_n_st_wp is null and uprn_n_nvd_np is null and
uprn_cs_np is null and uprn_cs_wp is not null then 1 else 0 end)
from all_health_upcid

select ADDRESS1, ADDRESS2, ADDRESS3, ADDRESS4, POSTCODE, UPRN
from all_health_upcid
where uprn_n_fc_wp is null and uprn_n_wp is null and 
uprn_n_3c_np is null and uprn_n_fc_np is null and
uprn_n_st_wp4 is null and uprn_n_np is null and
uprn_n_3c_wp is null and uprn_n_st_wp6 is null and
uprn_n_st_wp5 is null and uprn_fl_n_wp is null and
uprn_n_st_wp is null and uprn_n_nvd_np is null and
uprn_cs_np is null and uprn_ws_np is null and 
uprn_n_nvd_wp is null and uprn_cs_wp is null
order by postcode


select *
from all_health_upcid
where uprn = '185132506'

select *
from pointer.dbo.pointer_upcid
where uprn = '185132506'

--TEST HEALTH UPCID_WAL
select healthid, ADDRESS1, ADDRESS2, case when Address1 is null
	then REPLACE(Address2, ' ', '')
	else REPLACE(Address1, ' ', '')
	end as UPCID_WAL
from all_health_upcid

--TEST POINTER UPCID_WAL
select BUILDING_NUMBER, PRIMARY_THORFARE, ALT_THORFARE_NAME1, case when PRIMARY_THORFARE is null
	then REPLACE(BUILDING_NUMBER + ALT_THORFARE_NAME1, ' ', '')
	else REPLACE(BUILDING_NUMBER + PRIMARY_THORFARE, ' ', '')
	end as UPCID_WAL
from POINTER.DBO.POINTER_UPCID

--FOR 1ST LINE OF ADDRESS ONLY AND SECOND LINE OF ADDRESS ONLY, LOOK AT POINTER, MAY HAVE TO USE 2 FIELDS, BUILDING NUMBER + 1ST LINE OR BUILDING NUMBER + 2 LINE
--add UPCID_WAL
alter table all_health_upcid
add UPCID_WAL varchar(128)
--adding UPCID_WAL to all health
select healthid, case when Address1 is null 
	then dbo.unwanted(REPLACE(Address2, ' ', ''))
	else dbo.unwanted(REPLACE(Address1, ' ', ''))
	end as UPCID_WAL
	into #tempUPCID_WAL
	from all_health_upcid

update ah
set ah.upcid_wal = #tempUPCID_WAL.upcid_wal
from dbo.all_health_upcid ah
inner join #tempUPCID_WAL
on ah.healthid = #tempUPCID_WAL.healthid
--adding UPCID_WAL
alter table pointer.dbo.pointer_upcid
add UPCID_WAL varchar(128)

drop table #tempUPCID_WAL

select uprn, case when PRIMARY_THORFARE is null
	then dbo.unwanted(REPLACE(BUILDING_NUMBER + ALT_THORFARE_NAME1, ' ', ''))
	else dbo.unwanted(REPLACE(BUILDING_NUMBER + PRIMARY_THORFARE, ' ', ''))
	end as UPCID_WAL
	into #tempUPCID_WAL
	from pointer.dbo.pointer_upcid

update p
set p.upcid_wal = #tempUPCID_WAL.upcid_wal
from pointer.dbo.pointer_upcid p
inner join #tempUPCID_WAL
on p.uprn = #tempUPCID_WAL.uprn

drop table #tempUPCID_WAL
--adding uprn_wal
alter table all_health_upcid
add uprn_wal varchar(128)
--updating uprn_wal
--creating temp pointer with health id
select ah.healthid, p.upcid_wal, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_WAL = p.UPCID_WAL
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set upcid_wal = null
update health.dbo.all_health_upcid
set uprn_wal = null
update pointer.dbo.pointer_upcid
set upcid_wal = null
--updating health table with temp data
update ah
set ah.uprn_wal = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--case statement for all of the above--UPCID_WAL
select
sum(case when uprn_wal is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_wal and uprn is not null and uprn_wal is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_wal is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_wal then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_wal is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid

--testing abrevs
--street and saint
select * from all_health_upcid where address1 like '% st %' and address1 not like '%st.%'
select * from pointer.dbo.pointer_upcid where primary_thorfare like '% st %' and primary_thorfare not like '%st.%' 

--road and rd
select * from all_health_upcid where address1 like '% rd %'
select * from pointer.dbo.pointer_upcid where primary_thorfare like '% rd %'

--trying out new function for abrevs--street and saint
select UPRN, replace(pointer.dbo.removeAbrevs(Address1, 'st'), ' ', '')
from all_health_upcid 
--where address1 like '%st%' and uprn = '185208042'

select UPRN, replace(building_number + pointer.dbo.removeAbrevs(primary_thorfare, 'st'), ' ', '')
from pointer.dbo.pointer_upcid 
--where primary_thorfare like '%st%' and uprn = '185208042'

--road and rd
select UPRN, replace(pointer.dbo.removeAbrevs(Address1, 'rd'), ' ', '')
from all_health_upcid 
where address1 like '%rd%'

select UPRN, replace(building_number + pointer.dbo.removeAbrevs(primary_thorfare, 'rd'), ' ', '')
from pointer.dbo.pointer_upcid 
where primary_thorfare like '%rd%'

--test with merged function
select UPRN, replace(pointer.dbo.removeAbrevs(Address1), ' ', '')
from all_health_upcid 
--where address1 like '%rd%'

select UPRN, replace(building_number + pointer.dbo.removeAbrevs(primary_thorfare), ' ', '')
from pointer.dbo.pointer_upcid 
--where primary_thorfare like '%rd%'

--add UPCID_N_WAL_NOABREVS
alter table all_health_upcid
add UPCID_N_WAL_NOABREVS varchar(128)
--adding UPCID_N_WAL_NOABREVS to all health
select healthid, case when Address1 is null 
	then dbo.unwanted(replace(pointer.dbo.removeAbrevs(Address2), ' ', ''))
	else dbo.unwanted(replace(pointer.dbo.removeAbrevs(Address1), ' ', ''))
	end as UPCID_N_WAL_NOABREVS
	into #tempUPCID_N_WAL_NOABREVS
	from all_health_upcid

update ah
set ah.upcid_n_wal_noabrevs = #tempUPCID_N_WAL_NOABREVS.upcid_n_wal_noabrevs
from dbo.all_health_upcid ah
inner join #tempUPCID_N_WAL_NOABREVS
on ah.healthid = #tempUPCID_N_WAL_NOABREVS.healthid
--adding UPCID_N_WAL_NOABREVS
alter table pointer.dbo.pointer_upcid
add UPCID_N_WAL_NOABREVS varchar(128)

drop table #tempUPCID_N_WAL_NOABREVS

select uprn, case when PRIMARY_THORFARE is null
	then dbo.unwanted(replace(building_number + pointer.dbo.removeAbrevs(alt_thorfare_name1), ' ', ''))
	else dbo.unwanted(replace(building_number + pointer.dbo.removeAbrevs(primary_thorfare), ' ', ''))
	end as UPCID_N_WAL_NOABREVS
	into #tempUPCID_N_WAL_NOABREVS
	from pointer.dbo.pointer_upcid

update p
set p.upcid_n_wal_noabrevs = #tempUPCID_N_WAL_NOABREVS.upcid_n_wal_noabrevs
from pointer.dbo.pointer_upcid p
inner join #tempUPCID_N_WAL_NOABREVS
on p.uprn = #tempUPCID_N_WAL_NOABREVS.uprn

drop table #tempUPCID_N_WAL_NOABREVS
--adding uprn_n_wal_noabrevs
alter table all_health_upcid
add uprn_n_wal_noabrevs varchar(128)
--updating uprn_n_wal_noabrevs
--creating temp pointer with health id
select ah.healthid, p.upcid_n_wal_noabrevs, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_WAL_NOABREVS = p.UPCID_N_WAL_NOABREVS
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set upcid_n_wal_noabrevs = null
update health.dbo.all_health_upcid
set uprn_n_wal_noabrevs = null
update pointer.dbo.pointer_upcid
set upcid_n_wal_noabrevs = null
--updating health table with temp data
update ah
set ah.uprn_n_wal_noabrevs = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--case statement for all of the above--UPCID_N_WAL_NOABREVS
select
sum(case when uprn_n_wal_noabrevs_2 is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_n_wal_noabrevs_2 and uprn is not null and uprn_n_wal_noabrevs_2 is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_n_wal_noabrevs_2 is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_n_wal_noabrevs_2 then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_n_wal_noabrevs_2 is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid

--UPCID_N_WAL_NOABREVS_WP
--add UPCID_N_WAL_NOABREVS_WP
alter table all_health_upcid
add UPCID_N_WAL_NOABREVS_WP varchar(128)
--adding UPCID_N_WAL_NOABREVS_WP to all health
select healthid, case when Address1 is null 
	then dbo.unwanted(replace(pointer.dbo.removeAbrevs(Address2) + ISNULL(Postcode, ''), ' ', ''))
	else dbo.unwanted(replace(pointer.dbo.removeAbrevs(Address1) + ISNULL(Postcode, ''), ' ', ''))
	end as UPCID_N_WAL_NOABREVS_WP
	into #tempUPCID_N_WAL_NOABREVS_WP
	from all_health_upcid

update ah
set ah.upcid_n_wal_noabrevs_wp = #tempUPCID_N_WAL_NOABREVS_WP.upcid_n_wal_noabrevs_wp
from dbo.all_health_upcid ah
inner join #tempUPCID_N_WAL_NOABREVS_WP
on ah.healthid = #tempUPCID_N_WAL_NOABREVS_WP.healthid
--adding UPCID_N_WAL_NOABREVS_WP
alter table pointer.dbo.pointer_upcid
add UPCID_N_WAL_NOABREVS_WP varchar(128)

drop table #tempUPCID_N_WAL_NOABREVS_WP

select uprn, case when PRIMARY_THORFARE is null
	then dbo.unwanted(replace(ISNULL(building_number, '') + pointer.dbo.removeAbrevs(alt_thorfare_name1) + ISNULL(Postcode, ''), ' ', ''))
	else dbo.unwanted(replace(ISNULL(building_number, '') + pointer.dbo.removeAbrevs(primary_thorfare) + ISNULL(Postcode, ''), ' ', ''))
	end as UPCID_N_WAL_NOABREVS_WP
	into #tempUPCID_N_WAL_NOABREVS_WP
	from pointer.dbo.pointer_upcid

update p
set p.upcid_n_wal_noabrevs_wp = #tempUPCID_N_WAL_NOABREVS_WP.upcid_n_wal_noabrevs_wp
from pointer.dbo.pointer_upcid p
inner join #tempUPCID_N_WAL_NOABREVS_WP
on p.uprn = #tempUPCID_N_WAL_NOABREVS_WP.uprn

drop table #tempUPCID_N_WAL_NOABREVS_WP
--adding uprn_n_wal_noabrevs_wp
alter table all_health_upcid
add uprn_n_wal_noabrevs_wp varchar(128)
--updating uprn_n_wal_noabrevs_wp
--creating temp pointer with health id
select ah.healthid, p.upcid_n_wal_noabrevs_wp, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_WAL_NOABREVS_WP = p.UPCID_N_WAL_NOABREVS_WP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set upcid_n_wal_noabrevs_wp = null
update health.dbo.all_health_upcid
set uprn_n_wal_noabrevs_wp = null
update pointer.dbo.pointer_upcid
set upcid_n_wal_noabrevs_wp = null
--updating health table with temp data
update ah
set ah.uprn_n_wal_noabrevs_wp = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--case statement for all of the above--UPCID_N_WAL_NOABREVS_WP
select
sum(case when uprn_n_wal_noabrevs_wp is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_n_wal_noabrevs_wp and uprn is not null and uprn_n_wal_noabrevs_wp is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_n_wal_noabrevs_wp is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_n_wal_noabrevs_wp then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_n_wal_noabrevs_wp is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid

--sum of new UPCID's
select
sum(case when uprn_n_fc_wp is null and 
uprn_n_wp is null and uprn_n_3c_np is null and 
uprn_n_wal_noabrevs is null and uprn_n_fc_np is null and
uprn_wal is null and uprn_n_st_wp4 is null and
uprn_n_np is null and uprn_n_3c_wp is null and
uprn_n_wal_noabrevs_wp is null and uprn_n_st_wp5 is null and
uprn_n_st_wp6 is null and uprn_fl_n_wp is null and
uprn_n_nvd_np is null and uprn_cs_np is null and uprn_cs_wp is not null then 1 else 0 end)
from all_health_upcid

--group by postcode
select count(postcode), postcode
from all_health_upcid
group by postcode
having count(postcode)>1

select healthid, address1, postcode 
from all_health_upcid
where /*postcode = 'BT49 9PX' and*/ address1 is not null
group by postcode, healthid, address1

select building_number, primary_thorfare, uprn
from pointer.dbo.pointer_upcid
where postcode = 'BT49 9PX'
order by uprn

select * from all_health_upcid where HEALTHID = '3201776866'

select * from pointer.dbo.pointer_upcid where primary_thorfare = 'Victoria Road' and building_number like '226'

SELECT *
FROM all_health_UPCID
WHERE UPRN_N_WP Is Null AND UPRN_N_NP Is Null AND UPRN_WS_WP Is Null AND UPRN_WS_NP Is Null AND UPRN_CS_WP Is Null AND UPRN_CS_NP Is Null AND UPRN_N_NVD_WP Is Null AND UPRN_N_NVD_NP Is Null AND UPRN_NVD_WP Is Null AND UPRN_NVD_NP Is Null AND UPRN_N_FC_WP Is Null AND UPRN_N_FC_NP Is Null AND UPRN_N_3C_WP Is Null AND UPRN_N_3C_NP Is Null AND UPRN_FL_N_WP Is Null AND UPRN_N_ST_WP Is Null AND uprn_n_st_wp4 Is Null AND uprn_n_st_wp5 Is Null AND uprn_n_st_wp6 Is Null AND uprn_wal Is Null AND uprn_n_wal_noabrevs Is Null AND uprn_n_wal_noabrevs_wp Is Null

select case charindex(' ', address1, 1)
	when 0 then address1
	else substring(address1, 1, charindex(' ', address1, 1) - 1)
end + postcode
from all_health_upcid

select * from pointer.dbo.pointer_upcid

select building_number + postcode from pointer.dbo.pointer_upcid

select healthid, case when Address1 is null 
	then replace(case charindex(' ', address2, 1)
	when 0 then address2
	else substring(address2, 1, charindex(' ', address2, 1) - 1)
	end + postcode, ' ', '')
	else replace(case charindex(' ', address1, 1)
	when 0 then address1
	else substring(address1, 1, charindex(' ', address1, 1) - 1)
	end + postcode, ' ', '')
	end as UPCID_NL_WP
	--into #tempUPCID_NL_WP
	from all_health_upcid

--UPCID_NL_WP
--add UPCID_NL_WP
alter table all_health_upcid
add UPCID_NL_WP varchar(128)
--adding UPCID_NL_WP to all health
select healthid, case when Address1 is null 
	then replace(case charindex(' ', address2, 1)
	when 0 then address2
	else substring(address2, 1, charindex(' ', address2, 1) - 1)
	end + postcode, ' ', '')
	else replace(case charindex(' ', address1, 1)
	when 0 then address1
	else substring(address1, 1, charindex(' ', address1, 1) - 1)
	end + postcode, ' ', '')
	end as UPCID_NL_WP
	into #tempUPCID_NL_WP
	from all_health_upcid

update ah
set ah.upcid_nl_wp = #tempUPCID_NL_WP.upcid_nl_wp
from dbo.all_health_upcid ah
inner join #tempUPCID_NL_WP
on ah.healthid = #tempUPCID_NL_WP.healthid
--adding UPCID_NL_WP
alter table pointer.dbo.pointer_upcid
add UPCID_NL_WP varchar(128)

drop table #tempUPCID_NL_WP

select uprn, replace(ISNULL(building_number, '') + ISNULL(Postcode, ''), ' ', '') as UPCID_NL_WP
	into #tempUPCID_NL_WP
	from pointer.dbo.pointer_upcid

update p
set p.upcid_nl_wp = #tempUPCID_NL_WP.upcid_nl_wp
from pointer.dbo.pointer_upcid p
inner join #tempUPCID_NL_WP
on p.uprn = #tempUPCID_NL_WP.uprn

drop table #tempUPCID_NL_WP
--adding uprn_nl_wp
alter table all_health_upcid
add uprn_nl_wp varchar(128)
--updating uprn_nl_wp
--creating temp pointer with health id
select ah.healthid, p.upcid_nl_wp, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_NL_WP = p.UPCID_NL_WP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set upcid_nl_wp = null
update health.dbo.all_health_upcid
set uprn_nl_wp = null
update pointer.dbo.pointer_upcid
set upcid_nl_wp = null
--updating health table with temp data
update ah
set ah.uprn_nl_wp = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--case statement for all of the above--UPCID_N_WAL_NOABREVS_WP
select
sum(case when uprn_nl_wp is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_nl_wp and uprn is not null and uprn_nl_wp is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_nl_wp is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_nl_wp then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_nl_wp is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid

--sum of new UPCID
select
sum(case when uprn_n_fc_wp is null and 
uprn_n_wp is null and uprn_n_3c_np is null and
uprn_n_wal_noabrevs is null and uprn_n_fc_np is null and
uprn_n_st_wp4 is null and uprn_n_np is null and
uprn_wal is null and uprn_nl_wp is null and
uprn_n_3c_wp is null and uprn_n_wal_noabrevs_wp is null and
uprn_n_st_wp5 is null and uprn_n_st_wp6 is null and
uprn_fl_n_wp is null and uprn_n_nvd_np is null and
uprn_n_st_wp is not null
then 1 else 0 end)
from all_health_upcid

select * from all_health_upcid where uprn = '187346577'

select * from pointer.dbo.pointer_upcid where uprn = '187346577'

select * from all_health_upcid where upcid_n_wp = '32BT414AB'

select * from pointer.dbo.pointer_upcid where postcode = 'BT623UL'

select count(upcid_n_wp), upcid_n_wp
from all_health_upcid
group by upcid_n_wp
having count(upcid_n_wp)>1

select * from all_health_upcid where address1 like '%patricks way%'

select * from pointer.dbo.pointer_upcid where primary_thorfare like '%patricks way%'

--UPCID_NL_WP_2
--add UPCID_NL_WP_2
alter table all_health_upcid
add UPCID_NL_WP_2 varchar(128)
--adding UPCID_NL_WP_2 to all health
select healthid, case when Address1 is null 
	then replace(case charindex(' ', address2, 1)
	when 0 then address2
	else substring(address2, 1, charindex(' ', address2, 1) - 1)
	end + postcode, ' ', '')
	else replace(case charindex(' ', address1, 1)
	when 0 then address1
	else substring(address1, 1, charindex(' ', address1, 1) - 1)
	end + postcode, ' ', '')
	end as UPCID_NL_WP_2
	into #tempUPCID_NL_WP_2
	from all_health_upcid

update ah
set ah.upcid_nl_wp_2 = #tempUPCID_NL_WP_2.upcid_nl_wp_2
from dbo.all_health_upcid ah
inner join #tempUPCID_NL_WP_2
on ah.healthid = #tempUPCID_NL_WP_2.healthid
--adding UPCID_NL_WP_2
alter table pointer.dbo.pointer_upcid
add UPCID_NL_WP_2 varchar(128)

drop table #tempUPCID_NL_WP_2

select uprn, replace(ISNULL(building_number, '') + ISNULL(Postcode, ''), ' ', '') as UPCID_NL_WP_2
	into #tempUPCID_NL_WP_2
	from pointer.dbo.pointer_upcid

update p
set p.upcid_nl_wp_2 = #tempUPCID_NL_WP_2.upcid_nl_wp_2
from pointer.dbo.pointer_upcid p
inner join #tempUPCID_NL_WP_2
on p.uprn = #tempUPCID_NL_WP_2.uprn

drop table #tempUPCID_NL_WP_2
--adding uprn_nl_wp
alter table all_health_upcid
add uprn_nl_wp_2 varchar(128)
--updating uprn_nl_wp
--creating temp pointer with health id
select ah.healthid, p.upcid_nl_wp_2, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_NL_WP_2 = p.UPCID_NL_WP_2
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set upcid_nl_wp_2 = null
update health.dbo.all_health_upcid
set uprn_nl_wp_2 = null
update pointer.dbo.pointer_upcid
set upcid_nl_wp_2 = null
--updating health table with temp data
update ah
set ah.uprn_nl_wp_2 = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--case statement for all of the above--UPCID_NL_WP_2
select
sum(case when uprn_nl_wp_2 is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_nl_wp_2 and uprn is not null and uprn_nl_wp_2 is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_nl_wp_2 is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_nl_wp_2 then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_nl_wp_2 is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid


select healthid, REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'numbers')+LEFT(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'letters'), 1)+ISNULL(POSTCODE, ''), ' ', '') as UPCID_N_FC_WP_2 from all_health_upcid

--UPCID_N_FC_WP_2
--add UPCID_N_FC_WP_2
alter table all_health_upcid
add UPCID_N_FC_WP_2 varchar(128)
--adding UPCID_N_FC_WP_2 to all health
select healthid, REPLACE(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'numbers')+LEFT(POINTER.DBO.fn_extract_chars(ISNULL(Address1, '')+ISNULL(Address2, '')+ISNULL(Address3, '')+ISNULL(Address4, ''), 'letters'), 1)+ISNULL(POSTCODE, ''), ' ', '') 
	as UPCID_N_FC_WP_2
	into #tempUPCID_N_FC_WP_2
	from all_health_upcid

update ah
set ah.UPCID_N_FC_WP_2 = #tempUPCID_N_FC_WP_2.UPCID_N_FC_WP_2
from dbo.all_health_upcid ah
inner join #tempUPCID_N_FC_WP_2
on ah.healthid = #tempUPCID_N_FC_WP_2.healthid
--adding UPCID_N_FC_WP_2
alter table pointer.dbo.pointer_upcid
add UPCID_N_FC_WP_2 varchar(128)

drop table #tempUPCID_N_FC_WP_2

select uprn, REPLACE(pointer.dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') + ISNULL(PRIMARY_THORFARE, 
                      ''), 'numbers') + LEFT(pointer.dbo.fn_extract_chars(ISNULL(SUB_BUILDING_NAME, '') + ISNULL(BUILDING_NAME, '') + ISNULL(BUILDING_NUMBER, '') 
                      + ISNULL(PRIMARY_THORFARE, ''), 'letters'), 1) + ISNULL(POSTCODE, ''), ' ', '') 
	as UPCID_N_FC_WP_2	
	into #tempUPCID_N_FC_WP_2
	from pointer.dbo.pointer_upcid

update p
set p.UPCID_N_FC_WP_2 = #tempUPCID_N_FC_WP_2.UPCID_N_FC_WP_2
from pointer.dbo.pointer_upcid p
inner join #tempUPCID_N_FC_WP_2
on p.uprn = #tempUPCID_N_FC_WP_2.uprn

drop table #tempUPCID_N_FC_WP_2
--adding uprn_N_FC_WP_2
alter table all_health_upcid
add uprn_N_FC_WP_2 varchar(128)
--updating uprn_N_FC_WP_2
--creating temp pointer with health id
select ah.healthid, p.upcid_N_FC_WP, p.uprn
into #tempPointer
from health.dbo.all_health_upcid ah
inner join pointer.dbo.pointer_upcid p
on ah.UPCID_N_FC_WP = p.UPCID_N_FC_WP
--creating unique health id records
select healthid, count(*) as counter
into #tempHealth
from #tempPointer
group by healthid
having count(*) = 1
--updating health table resetting vaules to null
update health.dbo.all_health_upcid
set upcid_nl_wp_2 = null
update health.dbo.all_health_upcid
set uprn_nl_wp_2 = null
update pointer.dbo.pointer_upcid
set upcid_nl_wp_2 = null
--updating health table with temp data
update ah
set ah.uprn_N_FC_WP_2 = tp.uprn
from health.dbo.all_health_upcid ah
inner join #tempPointer tp
on ah.healthid = tp.healthid
inner join #tempHealth th
on ah.healthid = th.healthid
--dropping temp tables
drop table #tempPointer
drop table #tempHealth
--case statement for all of the above--UPCID_NL_WP_2
select
sum(case when uprn_N_FC_WP_2 is not null then 1 else 0 end) as HowManyUPRNS,
sum(case when uprn = uprn_N_FC_WP_2 and uprn is not null and uprn_N_FC_WP_2 is not null then 1 else 0 end) as HowManymatched,
sum(case when uprn is not null and uprn_N_FC_WP_2 is null then 1 else 0 end) as QANotUPCID,
sum(case when uprn <> uprn_N_FC_WP_2 then 1 else 0 end) as DifferentUPRN,
sum(case when uprn is null and uprn_N_FC_WP_2 is not null then 1 else 0 end) as UPCIDNotQA
from all_health_upcid

--sum of new UPCID

select
sum(case when 
uprn_n_wp IS NULL AND uprn_n_3c_np IS NULL AND
uprn_n_wal_noabrevs IS NULL AND uprn_n_fc_np IS NULL AND
uprn_n_st_wp4 IS NULL AND uprn_n_np IS NULL AND
uprn_wal IS NULL AND uprn_nl_wp IS NULL AND 
UPRN_N_FC_WP_2 IS NOT NULL
then 1 else 0 end)
from all_health_upcid

select
*  from all_health_upcid where
uprn_n_wp IS NULL AND uprn_n_3c_np IS NULL AND
uprn_n_wal_noabrevs IS NULL AND uprn_n_fc_np IS NULL AND
uprn_n_st_wp4 IS NULL AND uprn_n_np IS NULL AND
uprn_wal IS NULL AND uprn_nl_wp IS NULL AND 
UPRN_N_FC_WP_2 IS NOT NULL and left(pointer.dbo.fn_extract_chars(upcid_n_fc_wp_2, 'letters'), 1) = 'f' and address1 like 'flat%'

select * from all_health_upcid where left(pointer.dbo.fn_extract_chars(upcid_n_fc_wp_2, 'letters'), 1) = 'f' and address1 like 'flat%'

SELECT DBO.UNWANTED(ADDRESS1), ADDRESS1 FROM ALL_HEALTH_UPCID

SELECT ADDRESS1, ADDRESS2, ADDRESS3, ADDRESS4, POSTCODE, uprn_n_fc_np_2, UPCID_N_FC_NP, UPRN, UPRN
FROM all_health_UPCID
WHERE (((UPRN)<>[UPRN_N_FC_NP_2]))