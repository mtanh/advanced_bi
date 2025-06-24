USE CityDW;
GO

CREATE TABLE ViolationType (
  ViolationTypeKey INT IDENTITY(1,1) PRIMARY KEY,
  ViolationTypeName VARCHAR(100) UNIQUE NOT NULL
);
INSERT INTO ViolationType (ViolationTypeName) VALUES ('REDLIGHT'), ('SPEED'), ('OTHER');

CREATE TABLE StreetType (
  StreetTypeKey INT IDENTITY(1,1) PRIMARY KEY,
  StreetTypeName VARCHAR(100) UNIQUE NOT NULL
);
INSERT INTO StreetType (StreetTypeName)
VALUES
('AVENUE'),
('STREET'),
('ROAD'),
('BOULEVARD'),
('DRIVE'),
('PARKWAY'),
('PLACE'),
('COURT'),
('TERRACE'),
('CIRCLE'),
('WAY'),
('SQUARE'),
('LANE'),
('TRAIL'),
('HIGHWAY'),
('EXPRESSWAY'),
('EXTENSION'),
('ALLEY'),
('BROADWAY'),
('CRESCENT'),
('COVE'),
('ROW'),
('PIKE'),
('PLAZA'),
('TURNPIKE'),
('RUN'),
('WALK'),
('CENTER'),
('TRACE'),
('VIEW'),
('HEIGHTS'),
('RIDGE'),
('DALE'),
('KNOLL'),
('MEWS'),
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
  ValidFromDate DATETIME NULL DEFAULT GETDATE(),
  ValidToDate DATETIME NULL DEFAULT NULL,
  IsCurrent BIT NULL DEFAULT 1,
  CreateTimeStamp DATETIME NULL DEFAULT GETDATE(),
  UpdateTimeStamp DATETIME NULL DEFAULT NULL,
  SourceSystemCode VARCHAR(50) NULL,
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
  CreateTimeStamp DATETIME NULL,
  UpdateTimeStamp DATETIME NULL,
  SourceSystemCode VARCHAR(50) NULL,
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
  UpdateTimeStamp DATETIME NULL,
  SourceSystemCode VARCHAR(50) NULL,
  SourceFolder VARCHAR(50) NULL,
  Processed BIT NOT NULL DEFAULT 0
);


--truncate table [dbo].[Weather];
--truncate table [dbo].[Address];

--drop table [dbo].[TrafficViolation];
--drop table [dbo].[Address];
--drop table [dbo].[Location];
--drop table [dbo].[StreetType];
--drop table [dbo].[ViolationType];
--drop table [dbo].[Weather];