IF OBJECT_ID('dbo.rider_dim') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE [dbo].[rider_dim];
END

CREATE EXTERNAL TABLE [dbo].[rider_dim] 
WITH
( 
	LOCATION = 'star_schema/rider_dim', 
	DATA_SOURCE = [AZURESTORAGE],
	FILE_FORMAT = [TEXTFILEFORMAT]
)
AS (
    SELECT 
        [rider_id],
        [first_name],
        [last_name],
        [address],
        [birthday],
        [account_start_date],
        [account_end_date],
        [is_member]
    FROM [dbo].[staging_rider]
);


-- Verify the output
SELECT TOP 10 * FROM dbo.rider_dim;