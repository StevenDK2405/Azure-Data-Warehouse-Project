CREATE EXTERNAL TABLE dbo.staging_trip (
	[trip_id] nvarchar(4000),
	[rideable_type] nvarchar(4000),
	[start_at] varchar(50),
	[ended_at] varchar(50),
	[start_station_id] nvarchar(4000),
	[end_station_id] nvarchar(4000),
	[rider_id] bigint
	)
	WITH (
	LOCATION = 'source/publictrip.csv',
	DATA_SOURCE = [AZURESTORAGE],
	FILE_FORMAT = [TEXTFILEFORMAT]
	)
GO


SELECT TOP 100 * FROM dbo.staging_trip
GO