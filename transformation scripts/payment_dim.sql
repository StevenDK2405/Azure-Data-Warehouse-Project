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
        [amount],
        DATEPART(DAY, CONVERT(DATE, date)) AS day,
        DATEPART(MONTH, CONVERT(DATE, date)) AS month,
        DATEPART(QUARTER, CONVERT(DATE, date)) AS quarter,
        DATEPART(YEAR, CONVERT(DATE, date)) AS year,
        DATEPART(DAYOFYEAR, CONVERT(DATE, date)) AS day_of_year,
        DATEPART(WEEKDAY, CONVERT(DATE, date)) AS day_of_week
    FROM 
        [dbo].[staging_payment]
);


SELECT TOP 10 * FROM [dbo].[payment_dim];