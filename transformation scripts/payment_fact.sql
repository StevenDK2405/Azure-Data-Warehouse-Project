IF OBJECT_ID('dbo.payment_dim') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.payment_dim;
END

CREATE EXTERNAL TABLE dbo.payment_dim WITH
( 
	LOCATION = 'star_schema/payment_dim',
    DATA_SOURCE = [AZURESTORAGE],
	FILE_FORMAT = [TEXTFILEFORMAT]
)
AS (
    SELECT
        [payment_id], 
        [date],
        [rider_id],
        [amount]
    FROM 
        [dbo].[staging_payment]
);


SELECT TOP 10 * FROM [dbo].[payment_dim];