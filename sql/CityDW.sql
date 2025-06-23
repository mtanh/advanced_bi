USE CityDW;
GO

CREATE TABLE ViolationType (
  ViolationTypeKey INT IDENTITY(1,1) PRIMARY KEY,
  ViolationTypeName VARCHAR(100) NOT NULL
);

CREATE TABLE Location (
  LocationKey INT IDENTITY(1,1) PRIMARY KEY,
  Latitude VARCHAR(50) NULL,
  Longitude VARCHAR(50) NULL
);

CREATE TABLE StreetType (
  StreetTypeKey INT IDENTITY(1,1) PRIMARY KEY,
  StreetTypeName VARCHAR(100) NOT NULL
);

CREATE TABLE Address (
  AddressKey INT IDENTITY(1,1) PRIMARY KEY,
  StreetTypeKey INT NOT NULL,
  LocationKey INT UNIQUE NOT NULL,
  FullAddress VARCHAR(200) NOT NULL,
  ValidFromDate DATETIME NULL,
  ValidToDate DATETIME NULL,
  IsCurrent BIT NULL,
  CreateTimeStamp DATETIME NULL,
  UpdateTimeStamp DATETIME NULL,
  SourceSystemCode VARCHAR(50) NULL,
  OriginalFilePath VARCHAR(200) NULL,
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
  OriginalFilePath VARCHAR(200) NULL,
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
  CreateTimeStamp DATETIME NULL,
  UpdateTimeStamp DATETIME NULL,
  SourceSystemCode VARCHAR(50) NULL,
  OriginalFilePath VARCHAR(200) NULL
);
