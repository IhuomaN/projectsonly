--------SELECT TOP (1000) [Continent]
--------      ,[Country]
--------      ,[Trade_Value]
--------      ,[Year]
--------      ,[Action]
--------  FROM [GasPetroleum].[dbo].[Global Crude Petroleum Trade 1995-2021]
-------- Cleaning Data
-------- 1 Remove unnecessary columns 
----create view viewGasPetroleum26 as
----select 
----continent,
----country,
----trade_value,
----year,
----action
---- FROM [GasPetroleum].[dbo].[Global Crude Petroleum Trade 1995-2021];

 
-- --Testing Data
---- 1 data needs to be 1000 records(row count)
---- Data needs 5 fields (column counts test)
----columns must be string format and numerical
---- each records have to be unique, no duplicate

-- Row count check

select count(*) as no_of_rows
from 
viewGasPetroleum26;

-- 2 column count check
select  count(*) as column_count
from 
   information_schema.columns
where table_name = 'viewGasPetroleum26'

-- 3 Datatype check

select
column_name,
Data_type
from
information_schema.columns
where
table_name = 'viewGasPetroleum26'

--4 Duplicate check
SELECT continent, country, trade_value, year, action, COUNT(*) AS duplicate_count
FROM viewGasPetroleum26
GROUP BY continent, country, trade_value, year, action
HAVING COUNT(*) > 1;