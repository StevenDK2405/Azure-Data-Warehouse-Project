IF OBJECT_ID('dbo.trip_fact') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.trip_fact;
END

CREATE EXTERNAL TABLE dbo.trip_fact 
WITH
( 
	LOCATION = 'star_schema/trip_fact', 
	DATA_SOURCE = [AZURESTORAGE],
	FILE_FORMAT = [TEXTFILEFORMAT]
)
AS (
    SELECT 
        st.trip_id,
        st.rider_id,
        st.start_station_id, 
        st.end_station_id, 
        st.start_at AS start_time_id,    
        st.ended_at AS end_time_id,
        st.rideable_type,
        DATEDIFF(hour, st.start_at, st.ended_at) AS duration,
        DATEDIFF(year, sr.birthday, st.start_at) AS rider_age
    FROM 
        staging_trip st
    JOIN staging_rider sr ON sr.rider_id = st.rider_id
);


SELECT TOP 10 * FROM dbo.trip_fact;