IF OBJECT_ID('dbo.station_dim') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE [dbo].[station_dim];
END

CREATE EXTERNAL TABLE [dbo].[station_dim] 
WITH
( 
	LOCATION = 'star_schema/station_dim', 
	DATA_SOURCE = [AZURESTORAGE],
	FILE_FORMAT = [TEXTFILEFORMAT]
)
AS
SELECT 
	[station_id],
	[name],
	[latitude],
	[longitude]
FROM 
	[dbo].[staging_station];

-- Verify the output
SELECT TOP 10 * FROM dbo.station_dim;