USE CitySTG;
GO

CREATE TABLE Humidity (
  [datetime] VARCHAR(50) UNIQUE NULL,
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
  [SourceFolder] VARCHAR(50) NULL,
  [Processed] BIT NOT NULL DEFAULT 0
);


CREATE TABLE Pressure (
  [datetime] VARCHAR(50) UNIQUE NULL,
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
  [SourceFolder] VARCHAR(50) NULL,
  [Processed] BIT NOT NULL DEFAULT 0
);


CREATE TABLE Temperature (
  [datetime] VARCHAR(50) UNIQUE NULL,
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
  [SourceFolder] VARCHAR(50) NULL,
  [Processed] BIT NOT NULL DEFAULT 0
);

CREATE TABLE WindSpeed (
  [datetime] VARCHAR(50) UNIQUE NULL,
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
  [SourceFolder] VARCHAR(50) NULL,
  [Processed] BIT NOT NULL DEFAULT 0
);

CREATE TABLE RedLightViolation (
  [INTERSECTION] VARCHAR(100) NULL,
  [CAMERA ID] VARCHAR(50) NULL,
  [ADDRESS] VARCHAR(100) NULL,
  [VIOLATION DATE] VARCHAR(50) NULL,
  [VIOLATIONS] VARCHAR(50) NULL,
  [X COORDINATE] VARCHAR(50) NULL,
  [Y COORDINATE] VARCHAR(50) NULL,
  [LATITUDE] VARCHAR(50) NULL,
  [LONGITUDE] VARCHAR(50) NULL,
  [LOCATION] VARCHAR(50) NULL,
  [SourceFolder] VARCHAR(50) NULL,
  [Processed] BIT NOT NULL DEFAULT 0
);


CREATE TABLE SpeedCameraViolation (
  [ADDRESS] VARCHAR(100) NULL,
  [CAMERA ID] VARCHAR(50) NULL,
  [VIOLATION DATE] VARCHAR(50) NULL,
  [VIOLATIONS] VARCHAR(50) NULL,
  [X COORDINATE] VARCHAR(50) NULL,
  [Y COORDINATE] VARCHAR(50) NULL,
  [LATITUDE] VARCHAR(50) NULL,
  [LONGITUDE] VARCHAR(50) NULL,
  [LOCATION] VARCHAR(50) NULL,
  [SourceFolder] VARCHAR(50) NULL,
  [Processed] BIT NOT NULL DEFAULT 0
);

CREATE VIEW v_UnprocessedChicagoWeatherStage AS
SELECT
    TRY_CAST(h.[datetime] AS DATETIME) AS DateTime,
    TRY_CAST(h.[Chicago] AS FLOAT) AS Humidity,
    TRY_CAST(p.[Chicago] AS FLOAT) AS Pressure,
    TRY_CAST(t.[Chicago] AS FLOAT) AS Temperature,
    TRY_CAST(w.[Chicago] AS FLOAT) AS WindSpeed,
    '1' AS SourceSystemCode,
    h.[SourceFolder] AS SourceFolder
FROM Humidity h
JOIN Pressure p ON h.[datetime] = p.[datetime]
JOIN Temperature t ON h.[datetime] = t.[datetime]
JOIN WindSpeed w ON h.[datetime] = w.[datetime]
WHERE
    h.Processed = 0 AND
    p.Processed = 0 AND
    t.Processed = 0 AND
    w.Processed = 0;

CREATE VIEW v_UnprocessedRedLightViolationLocationsStage AS
SELECT DISTINCT
    TRY_CAST(r.[LATITUDE] AS VARCHAR(50)) AS Latitude,
    TRY_CAST(r.[LONGITUDE] AS VARCHAR(50)) AS Longitude
FROM RedLightViolation r
WHERE
    r.Processed = 0;


CREATE VIEW v_UnprocessedRedLightViolationStage AS
SELECT
    [INTERSECTION],
    [CAMERA ID],
    [ADDRESS],
    [VIOLATION DATE],
    [VIOLATIONS],
    [X COORDINATE],
    [Y COORDINATE],
    [LATITUDE],
    [LONGITUDE],
    [LOCATION],
    [SourceFolder]
FROM RedLightViolation
WHERE
    Processed = 0;


--truncate table [dbo].[Humidity];
--truncate table [dbo].[Pressure];
--truncate table [dbo].[RedLightViolation];
--truncate table [dbo].[SpeedCameraViolation];
--truncate table [dbo].[Temperature];
--truncate table [dbo].[WindSpeed];





