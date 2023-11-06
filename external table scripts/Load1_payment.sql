IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'AzureStorage') 
    CREATE EXTERNAL DATA SOURCE AzureStorage
    WITH (
        LOCATION = 'wasbs://divvyprojectcontainer@divvystorageaccount.blob.core.windows.net' 
    )
GO


IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'TextFileFormat') 
    CREATE EXTERNAL FILE FORMAT [TextFileFormat] 
    WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
           FORMAT_OPTIONS (
             FIELD_TERMINATOR = ',',
             STRING_DELIMITER = '"',
             USE_TYPE_DEFAULT = FALSE
            ))
GO

CREATE EXTERNAL TABLE dbo.staging_payment (
	[payment_id] bigint,
	[date] varchar(50),
	[amount] float,
	[rider_id] bigint
	)
	WITH (
	LOCATION = 'source/publicpayment.csv',
	DATA_SOURCE = [AZURESTORAGE],
	FILE_FORMAT = [TEXTFILEFORMAT]
	)
GO


SELECT TOP 100 * FROM dbo.staging_payment
GO