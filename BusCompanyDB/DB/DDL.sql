GO
USE master;

DROP DATABASE IF EXISTS Bus;

CREATE DATABASE Bus;

GO
USE Bus;

GO
CREATE TABLE [Route] (
	IDRoute INT IDENTITY(1,1),
	[Name] VARCHAR(50),
	[Description] VARCHAR(100),
	PRIMARY KEY(IDRoute)
);

CREATE TABLE Journey (
	IDJourney INT Identity(1,1),
	[Name] VARCHAR(50),
	PRIMARY KEY(IDJourney)
);

CREATE TABLE Town (
	IDTown INT Identity(1,1),
	[Name] VARCHAR(50),
	PRIMARY KEY(IDTown),
);

CREATE TABLE TypeBus (
	IDTypeBus INT Identity(1,1),
	[Description] VARCHAR(100),
	PRIMARY KEY(IDTypeBus)
);

CREATE TABLE Bus (
	licencePlate VARCHAR(50),
	capacity INT,
	size VARCHAR(50),
	IDTypeBus INT,
	IDRoute INT,
	PRIMARY KEY(licencePlate),
	FOREIGN KEY(IDTypeBus) REFERENCES TypeBus(IDTypeBus),
	FOREIGN KEY(IDRoute) REFERENCES [Route](IDRoute)

);

CREATE TABLE RouteJourney (
	IDRoute INT,
	IDJourney INT,
	PRIMARY KEY(IDRoute,IDJourney),
	FOREIGN KEY(IDRoute) REFERENCES [Route] (IDRoute),
	FOREIGN KEY(IDJourney) REFERENCES Journey (IDJourney)
);

CREATE TABLE RouteLog (
	IDRouteLog INT Identity(1,1),
	passAverage INT,
	[Date] DATE,
	IDRoute INT,
	PRIMARY KEY(IDRouteLog),
	FOREIGN KEY(IDRoute) REFERENCES [Route] (IDRoute)

);

CREATE TABLE Garage (	
	IDGarage INT Identity(1,1),
	[Name] VARCHAR(50),
	Capacity INT,
	IDTown INT,
	PRIMARY KEY(IDGarage),
	FOREIGN KEY(IDTown) REFERENCES Town(IDTown)
);

CREATE TABLE Journey_town (
	IDTown INT,
	IDJourney INT,
	PRIMARY KEY(IDTown,IDJourney),
	FOREIGN KEY(IDTown) REFERENCES Town(IDTown),
	FOREIGN KEY(IDJourney) REFERENCES Journey(IDJourney),
);
