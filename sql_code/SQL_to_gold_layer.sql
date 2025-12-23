--CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'd8TySvmWr4rPBUkSHre';
--CREATE DATABASE SCOPED CREDENTIAL shreeadmin WITH IDENTITY = 'Managed Identity';

-- select * from sys.database_credentials
CREATE EXTERNAL FILE FORMAT extfileformat WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);

CREATE EXTERNAL DATA SOURCE goldlayer WITH (
    LOCATION = 'https://olistdatastoreacc.dfs.core.windows.net/olistdata/gold/',
    CREDENTIAL = shreeadmin
);

CREATE EXTERNAL TABLE gold.finaltable WITH (
        LOCATION = 'Final_Serving',
        DATA_SOURCE = goldlayer,
        FILE_FORMAT = extfileformat
) AS
SELECT * FROM gold.final2;

