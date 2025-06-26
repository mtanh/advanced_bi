USE CityDW;
GO

--drop table [dbo].[TrafficViolation];
--drop table [dbo].[Address];
--drop table [dbo].[Location];
--drop table [dbo].[StreetType];
--drop table [dbo].[ViolationType];
--drop table [dbo].[Weather];

CREATE TABLE ViolationType (
  ViolationTypeKey INT IDENTITY(1,1) PRIMARY KEY,
  ViolationTypeName VARCHAR(50) UNIQUE NOT NULL
);
INSERT INTO ViolationType (ViolationTypeName) VALUES ('REDLIGHT'), ('SPEED'), ('OTHER');

CREATE TABLE StreetType (
  StreetTypeKey INT IDENTITY(1,1) PRIMARY KEY,
  StreetTypeName VARCHAR(50) UNIQUE NOT NULL
);
INSERT INTO StreetType (StreetTypeName)
VALUES
('AVENUE'),
('STREET'),
('ROAD'),
('BOULEVARD'),
('DRIVE'),
('PARKWAY'),
('HIGHWAY'),
('BROADWAY'),
('OTHER');

CREATE TABLE Location (
  LocationKey INT IDENTITY(1,1) PRIMARY KEY,
  Latitude VARCHAR(50) NULL,
  Longitude VARCHAR(50) NULL,
  Processed BIT NOT NULL DEFAULT 0,
  CONSTRAINT UQ_Location_LatLong UNIQUE (Latitude, Longitude)
);

CREATE TABLE Address (
  AddressKey INT IDENTITY(1,1) PRIMARY KEY,
  StreetTypeKey INT NOT NULL,
  LocationKey INT UNIQUE NOT NULL,
  FullAddress VARCHAR(100) NOT NULL,
  CreateTimeStamp DATETIME NULL DEFAULT GETDATE(),
  SourceSystemCode INT NULL,
  SourceFolder VARCHAR(50) NULL,
  Processed BIT NOT NULL DEFAULT 0,
  FOREIGN KEY (StreetTypeKey) REFERENCES StreetType(StreetTypeKey),
  FOREIGN KEY (LocationKey) REFERENCES Location(LocationKey)
);

CREATE TABLE TrafficViolation (
  ViolationKey INT IDENTITY(1,1) PRIMARY KEY,
  ViolationTypeKey INT NOT NULL,
  AddressKey INT NOT NULL,
  ViolationDate DATETIME NULL,
  ViolationCount INT NULL,
  CreateTimeStamp DATETIME NULL DEFAULT GETDATE(),
  SourceSystemCode INT NULL,
  SourceFolder VARCHAR(50) NULL,
  Processed BIT NOT NULL DEFAULT 0,
  FOREIGN KEY (ViolationTypeKey) REFERENCES ViolationType(ViolationTypeKey),
  FOREIGN KEY (AddressKey) REFERENCES Address(AddressKey)
);

CREATE TABLE Weather (
  WeatherKey INT IDENTITY(1,1) PRIMARY KEY,
  DateTime DATETIME NULL,
  Humidity FLOAT NULL,
  Pressure FLOAT NULL,
  Temperature FLOAT NULL,
  WindSpeed FLOAT NULL,
  CreateTimeStamp DATETIME NULL DEFAULT GETDATE(),
  SourceSystemCode INT NULL,
  SourceFolder VARCHAR(50) NULL,
  Processed BIT NOT NULL DEFAULT 0
);


CREATE VIEW v_Unprocessed_TrafficViolation_Distinct_Dates_Nds AS
SELECT DISTINCT
  TRY_CAST([ViolationDate] AS DATE) AS [ViolationDate],
  [SourceSystemCode],
  [SourceFolder]
FROM TrafficViolation
WHERE Processed = 0;


CREATE VIEW v_Unprocessed_TrafficViolation_Addresses_Nds AS
SELECT 
  A.AddressKey,
  A.FullAddress,
  ST.StreetTypeName,
  TRY_CAST(L.Latitude AS FLOAT) AS Latitude,
  TRY_CAST(L.Longitude AS FLOAT) AS Longitude,
  CONCAT('(', L.Latitude, ', ', L.Longitude, ')') AS Location,
  A.CreateTimeStamp,
  A.SourceSystemCode,
  A.SourceFolder
FROM Address A
JOIN Location L ON A.LocationKey = L.LocationKey
JOIN StreetType ST ON A.StreetTypeKey = ST.StreetTypeKey
WHERE A.Processed = 0 AND L.Processed = 0;


CREATE VIEW v_Unprocessed_TrafficViolation_Weathers_Nds AS
SELECT 
  CAST(W.DateTime AS DATE) AS WeatherDate,

  AVG(W.Humidity) AS AverageHumidity,
  AVG(W.Pressure) AS AveragePressure,
  AVG(W.Temperature) AS AverageTemperature,
  AVG(W.WindSpeed) AS AverageWindSpeed,

  MIN(W.SourceSystemCode) AS SourceSystemCode,
  MIN(TV.SourceFolder) AS SourceFolder
FROM Weather W
JOIN TrafficViolation TV ON CAST(W.DateTime AS DATE) = CAST(TV.ViolationDate AS DATE)
WHERE W.Processed = 0 AND TV.Processed = 0
GROUP BY CAST(W.DateTime AS DATE);


CREATE VIEW v_Unprocessed_TrafficViolation_CountEx_Nds AS
SELECT
  ViolationTypeKey,
  CAST(ViolationDate AS DATE) AS ViolationDay,
  AddressKey,
  SourceSystemCode,
  SourceFolder,
  CASE WHEN ViolationTypeKey = 1 THEN SUM(ViolationCount) ELSE 0 END AS RedLightViolations,
  CASE WHEN ViolationTypeKey = 2 THEN SUM(ViolationCount) ELSE 0 END AS SpeedingViolations,
  CASE 
      WHEN ViolationTypeKey IN (1, 2) THEN SUM(ViolationCount)
      ELSE 0
  END AS TotalViolations
FROM TrafficViolation
WHERE Processed = 0 AND ViolationTypeKey IN (1, 2)
GROUP BY
  ViolationTypeKey,
  CAST(ViolationDate AS DATE),
  AddressKey,
  SourceSystemCode,
  SourceFolder;
