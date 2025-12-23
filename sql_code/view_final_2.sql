create view gold.final2
as
SELECT
     *
FROM
    OPENROWSET(
        BULK 'https://olistdatastoreacc.dfs.core.windows.net/olistdata/silver/',
        FORMAT = 'PARQUET'
        ) AS result2
where order_status = 'delivered'

select * from gold.final2