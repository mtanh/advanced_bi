USE WeatherTrafficDM;
GO

--drop table [FactTrafficViolation];
--drop table [DimAddress];
--drop table [DimWeather];
--drop table [DimDate];

CREATE TABLE DimDate (
  DateKey INT IDENTITY(1,1) PRIMARY KEY,
  Date DATE UNIQUE NOT NULL,
  DayNumberOfWeek INT,
  DayNumberOfMonth INT,
  DayNumberOfYear INT,
  WeekNumberOfYear INT,
  DayNameOfWeek VARCHAR(50),
  MonthName VARCHAR(50),
  CalendarQuarter INT,
  CalendarYear INT,
  IsWeekend BIT,
  CreateTimeStamp DATETIME NULL DEFAULT GETDATE(),
  UpdateTimeStamp DATETIME NULL DEFAULT NULL,
  SourceSystemCode INT NULL,
  SourceFolder VARCHAR(50) NULL
);

CREATE TABLE DimAddress (
  AddressKey INT IDENTITY(1,1) PRIMARY KEY,
  AddressKeyOfNds INT NOT NULL,
  FullAddress VARCHAR(100),
  StreetTypeName VARCHAR(50),
  Latitude FLOAT,
  Longitude FLOAT,
  Location VARCHAR(200),
  ValidFromDate DATE NULL DEFAULT GETDATE(),
  ValidToDate DATE NULL DEFAULT NULL,
  IsCurrent BIT DEFAULT 1,
  CreateTimeStamp DATETIME NULL DEFAULT GETDATE(),
  UpdateTimeStamp DATETIME NULL DEFAULT NULL,
  SourceSystemCode INT NULL,
  SourceFolder VARCHAR(50) NULL
);

CREATE TABLE DimWeather (
  WeatherKey INT IDENTITY(1,1) PRIMARY KEY,
  WeatherDate DATE NOT NULL,
    
  AverageHumidity FLOAT,
  AveragePressure FLOAT,
  AverageTemperature FLOAT,
  AverageWindSpeed FLOAT,

  TemperatureRangeName VARCHAR(50) NULL,
  HumidityLevelName VARCHAR(50) NULL,
  PressureLevelName VARCHAR(50) NULL,
  WindLevelName VARCHAR(50) NULL,
  WeatherComfortLevel VARCHAR(50) NULL,
  OverallWeatherDescription VARCHAR(50) NULL,
  ComfortLevel VARCHAR(50) NULL,

  CreateTimeStamp DATETIME NULL DEFAULT GETDATE(),
  UpdateTimeStamp DATETIME NULL DEFAULT NULL,
    
  SourceSystemCode INT NULL,
  SourceFolder VARCHAR(50) NULL,
  FOREIGN KEY (WeatherDate) REFERENCES DimDate(Date)
);

CREATE TABLE FactTrafficViolation (
  DateKey INT NOT NULL,
  WeatherKey INT NOT NULL,
  AddressKey INT NOT NULL,

  RedLightViolations INT DEFAULT 0,
  SpeedingViolations INT DEFAULT 0,
  TotalViolations INT DEFAULT 0,

  CreateTimeStamp DATETIME NULL DEFAULT GETDATE(),
  UpdateTimeStamp DATETIME NULL DEFAULT NULL,

  SourceSystemCode INT NULL,
  SourceFolder VARCHAR(50) NULL,
  FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),
  FOREIGN KEY (WeatherKey) REFERENCES DimWeather(WeatherKey),
  FOREIGN KEY (AddressKey) REFERENCES DimAddress(AddressKey)
);


