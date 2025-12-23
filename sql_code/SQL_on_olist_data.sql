SELECT
     *
FROM
    OPENROWSET(
        BULK 'https://olistdatastoreacc.dfs.core.windows.net/olistdata/silver/',
        FORMAT = 'PARQUET'
        ) AS [result]
