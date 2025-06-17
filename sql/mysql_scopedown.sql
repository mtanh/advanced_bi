DELETE FROM WeatherDS.Humidity
WHERE datetime < '2014-07-01 00:00:00' OR datetime > '2017-11-30 23:59:59';

DELETE FROM WeatherDS.Pressure 
WHERE datetime < '2014-07-01 00:00:00' OR datetime > '2017-11-30 23:59:59';

DELETE FROM WeatherDS.Temperature 
WHERE datetime < '2014-07-01 00:00:00' OR datetime > '2017-11-30 23:59:59';

DELETE FROM WeatherDS.WindSpeed 
WHERE datetime < '2014-07-01 00:00:00' OR datetime > '2017-11-30 23:59:59';

DELETE FROM TrafficViolationDS.RedLightViolation 
WHERE STR_TO_DATE(`VIOLATION DATE`, '%m/%d/%Y') < '2014-07-01' OR STR_TO_DATE(`VIOLATION DATE`, '%m/%d/%Y') > '2017-11-30';
