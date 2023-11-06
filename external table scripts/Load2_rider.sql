CREATE EXTERNAL TABLE dbo.staging_rider (
	[rider_id] bigint,
	[first_name] nvarchar(4000),
	[last_name] nvarchar(4000),
	[address] nvarchar(4000),
	[birthday] varchar(50),
	[account_start_date] varchar(50),
	[account_end_date] varchar(50),
	[is_member] bit
	)
	WITH (
	LOCATION = 'source/publicrider.csv',
	DATA_SOURCE = [AZURESTORAGE],
	FILE_FORMAT = [TEXTFILEFORMAT]
	)
GO


SELECT TOP 100 * FROM dbo.staging_rider
GO