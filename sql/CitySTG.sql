USE CitySTG;
GO

CREATE TABLE humidity (
  [datetime] VARCHAR(50) NULL,
  [Vancouver] VARCHAR(50) NULL,
  [Portland] VARCHAR(50) NULL,
  [San Francisco] VARCHAR(50) NULL,
  [Seattle] VARCHAR(50) NULL,
  [Los Angeles] VARCHAR(50) NULL,
  [San Diego] VARCHAR(50) NULL,
  [Las Vegas] VARCHAR(50) NULL,
  [Phoenix] VARCHAR(50) NULL,
  [Albuquerque] VARCHAR(50) NULL,
  [Denver] VARCHAR(50) NULL,
  [San Antonio] VARCHAR(50) NULL,
  [Dallas] VARCHAR(50) NULL,
  [Houston] VARCHAR(50) NULL,
  [Kansas City] VARCHAR(50) NULL,
  [Minneapolis] VARCHAR(50) NULL,
  [Saint Louis] VARCHAR(50) NULL,
  [Chicago] VARCHAR(50) NULL,
  [Nashville] VARCHAR(50) NULL,
  [Indianapolis] VARCHAR(50) NULL,
  [Atlanta] VARCHAR(50) NULL,
  [Detroit] VARCHAR(50) NULL,
  [Jacksonville] VARCHAR(50) NULL,
  [Charlotte] VARCHAR(50) NULL,
  [Miami] VARCHAR(50) NULL,
  [Pittsburgh] VARCHAR(50) NULL,
  [Toronto] VARCHAR(50) NULL,
  [Philadelphia] VARCHAR(50) NULL,
  [New York] VARCHAR(50) NULL,
  [Montreal] VARCHAR(50) NULL,
  [Boston] VARCHAR(50) NULL,
  [Beersheba] VARCHAR(50) NULL,
  [Tel Aviv District] VARCHAR(50) NULL,
  [Eilat] VARCHAR(50) NULL,
  [Haifa] VARCHAR(50) NULL,
  [Nahariyya] VARCHAR(50) NULL,
  [Jerusalem] VARCHAR(50) NULL,
  [Processed] BIT NOT NULL DEFAULT 0
);


CREATE TABLE pressure (
  [datetime] VARCHAR(50) NULL,
  [Vancouver] VARCHAR(50) NULL,
  [Portland] VARCHAR(50) NULL,
  [San Francisco] VARCHAR(50) NULL,
  [Seattle] VARCHAR(50) NULL,
  [Los Angeles] VARCHAR(50) NULL,
  [San Diego] VARCHAR(50) NULL,
  [Las Vegas] VARCHAR(50) NULL,
  [Phoenix] VARCHAR(50) NULL,
  [Albuquerque] VARCHAR(50) NULL,
  [Denver] VARCHAR(50) NULL,
  [San Antonio] VARCHAR(50) NULL,
  [Dallas] VARCHAR(50) NULL,
  [Houston] VARCHAR(50) NULL,
  [Kansas City] VARCHAR(50) NULL,
  [Minneapolis] VARCHAR(50) NULL,
  [Saint Louis] VARCHAR(50) NULL,
  [Chicago] VARCHAR(50) NULL,
  [Nashville] VARCHAR(50) NULL,
  [Indianapolis] VARCHAR(50) NULL,
  [Atlanta] VARCHAR(50) NULL,
  [Detroit] VARCHAR(50) NULL,
  [Jacksonville] VARCHAR(50) NULL,
  [Charlotte] VARCHAR(50) NULL,
  [Miami] VARCHAR(50) NULL,
  [Pittsburgh] VARCHAR(50) NULL,
  [Toronto] VARCHAR(50) NULL,
  [Philadelphia] VARCHAR(50) NULL,
  [New York] VARCHAR(50) NULL,
  [Montreal] VARCHAR(50) NULL,
  [Boston] VARCHAR(50) NULL,
  [Beersheba] VARCHAR(50) NULL,
  [Tel Aviv District] VARCHAR(50) NULL,
  [Eilat] VARCHAR(50) NULL,
  [Haifa] VARCHAR(50) NULL,
  [Nahariyya] VARCHAR(50) NULL,
  [Jerusalem] VARCHAR(50) NULL,
  [Processed] BIT NOT NULL DEFAULT 0
);


CREATE TABLE temperature (
  [datetime] VARCHAR(50) NULL,
  [Vancouver] VARCHAR(50) NULL,
  [Portland] VARCHAR(50) NULL,
  [San Francisco] VARCHAR(50) NULL,
  [Seattle] VARCHAR(50) NULL,
  [Los Angeles] VARCHAR(50) NULL,
  [San Diego] VARCHAR(50) NULL,
  [Las Vegas] VARCHAR(50) NULL,
  [Phoenix] VARCHAR(50) NULL,
  [Albuquerque] VARCHAR(50) NULL,
  [Denver] VARCHAR(50) NULL,
  [San Antonio] VARCHAR(50) NULL,
  [Dallas] VARCHAR(50) NULL,
  [Houston] VARCHAR(50) NULL,
  [Kansas City] VARCHAR(50) NULL,
  [Minneapolis] VARCHAR(50) NULL,
  [Saint Louis] VARCHAR(50) NULL,
  [Chicago] VARCHAR(50) NULL,
  [Nashville] VARCHAR(50) NULL,
  [Indianapolis] VARCHAR(50) NULL,
  [Atlanta] VARCHAR(50) NULL,
  [Detroit] VARCHAR(50) NULL,
  [Jacksonville] VARCHAR(50) NULL,
  [Charlotte] VARCHAR(50) NULL,
  [Miami] VARCHAR(50) NULL,
  [Pittsburgh] VARCHAR(50) NULL,
  [Toronto] VARCHAR(50) NULL,
  [Philadelphia] VARCHAR(50) NULL,
  [New York] VARCHAR(50) NULL,
  [Montreal] VARCHAR(50) NULL,
  [Boston] VARCHAR(50) NULL,
  [Beersheba] VARCHAR(50) NULL,
  [Tel Aviv District] VARCHAR(50) NULL,
  [Eilat] VARCHAR(50) NULL,
  [Haifa] VARCHAR(50) NULL,
  [Nahariyya] VARCHAR(50) NULL,
  [Jerusalem] VARCHAR(50) NULL,
  [Processed] BIT NOT NULL DEFAULT 0
);

CREATE TABLE windspeed (
  [datetime] VARCHAR(50) NULL,
  [Vancouver] VARCHAR(50) NULL,
  [Portland] VARCHAR(50) NULL,
  [San Francisco] VARCHAR(50) NULL,
  [Seattle] VARCHAR(50) NULL,
  [Los Angeles] VARCHAR(50) NULL,
  [San Diego] VARCHAR(50) NULL,
  [Las Vegas] VARCHAR(50) NULL,
  [Phoenix] VARCHAR(50) NULL,
  [Albuquerque] VARCHAR(50) NULL,
  [Denver] VARCHAR(50) NULL,
  [San Antonio] VARCHAR(50) NULL,
  [Dallas] VARCHAR(50) NULL,
  [Houston] VARCHAR(50) NULL,
  [Kansas City] VARCHAR(50) NULL,
  [Minneapolis] VARCHAR(50) NULL,
  [Saint Louis] VARCHAR(50) NULL,
  [Chicago] VARCHAR(50) NULL,
  [Nashville] VARCHAR(50) NULL,
  [Indianapolis] VARCHAR(50) NULL,
  [Atlanta] VARCHAR(50) NULL,
  [Detroit] VARCHAR(50) NULL,
  [Jacksonville] VARCHAR(50) NULL,
  [Charlotte] VARCHAR(50) NULL,
  [Miami] VARCHAR(50) NULL,
  [Pittsburgh] VARCHAR(50) NULL,
  [Toronto] VARCHAR(50) NULL,
  [Philadelphia] VARCHAR(50) NULL,
  [New York] VARCHAR(50) NULL,
  [Montreal] VARCHAR(50) NULL,
  [Boston] VARCHAR(50) NULL,
  [Beersheba] VARCHAR(50) NULL,
  [Tel Aviv District] VARCHAR(50) NULL,
  [Eilat] VARCHAR(50) NULL,
  [Haifa] VARCHAR(50) NULL,
  [Nahariyya] VARCHAR(50) NULL,
  [Jerusalem] VARCHAR(50) NULL,
  [Processed] BIT NOT NULL DEFAULT 0
);

CREATE TABLE redlightviolation (
  [INTERSECTION] VARCHAR(50) NULL,
  [CAMERA ID] VARCHAR(50) NULL,
  [ADDRESS] VARCHAR(50) NULL,
  [VIOLATION DATE] VARCHAR(50) NULL,
  [VIOLATIONS] VARCHAR(50) NULL,
  [X COORDINATE] VARCHAR(50) NULL,
  [Y COORDINATE] VARCHAR(50) NULL,
  [LATITUDE] VARCHAR(50) NULL,
  [LONGITUDE] VARCHAR(50) NULL,
  [LOCATION] VARCHAR(50) NULL,
  [Processed] BIT NOT NULL DEFAULT 0
);


CREATE TABLE speedcameraviolation (
  [ADDRESS] VARCHAR(50) NULL,
  [CAMERA ID] VARCHAR(50) NULL,
  [VIOLATION DATE] VARCHAR(50) NULL,
  [VIOLATIONS] VARCHAR(50) NULL,
  [X COORDINATE] VARCHAR(50) NULL,
  [Y COORDINATE] VARCHAR(50) NULL,
  [LATITUDE] VARCHAR(50) NULL,
  [LONGITUDE] VARCHAR(50) NULL,
  [LOCATION] VARCHAR(50) NULL,
  [Processed] BIT NOT NULL DEFAULT 0
);


CREATE VIEW v_UnprocessedChicagoWeatherStage AS
SELECT
    TRY_CAST(h.[datetime] AS DATETIME) AS DateTime,
    TRY_CAST(h.[Chicago] AS FLOAT) AS Humidity,
    TRY_CAST(p.[Chicago] AS FLOAT) AS Pressure,
    TRY_CAST(t.[Chicago] AS FLOAT) AS Temperature,
    TRY_CAST(w.[Chicago] AS FLOAT) AS WindSpeed,
    GETDATE() AS CreateTimeStamp,
    GETDATE() AS UpdateTimeStamp,
    '1' AS SourceSystemCode,
    'Server01/Weather' AS OriginalFilePath
FROM humidity h
JOIN pressure p ON h.[datetime] = p.[datetime]
JOIN temperature t ON h.[datetime] = t.[datetime]
JOIN windspeed w ON h.[datetime] = w.[datetime]
WHERE
    h.Processed = 0 AND
    p.Processed = 0 AND
    t.Processed = 0 AND
    w.Processed = 0;


