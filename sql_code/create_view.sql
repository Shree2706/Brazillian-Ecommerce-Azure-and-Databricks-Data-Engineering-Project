create schema gold

create view gold.final
as
SELECT
     *
FROM
    OPENROWSET(
        BULK 'https://olistdatastoreacc.dfs.core.windows.net/olistdata/silver/',
        FORMAT = 'PARQUET'
        ) AS result1

select * from gold.final