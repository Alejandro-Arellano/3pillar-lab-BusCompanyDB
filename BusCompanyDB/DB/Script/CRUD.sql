USE Bus;

------------------------
----------TOWN----------
------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectTowns
AS
BEGIN;
	SELECT * FROM Town;
END;

EXEC dbo.SelectTowns;

GO --CREATE--
CREATE PROCEDURE dbo.InsertTown
(@TownName VARCHAR(50))
AS
BEGIN;
	INSERT INTO Town ([Name]) VALUES (@TownName);
	EXEC dbo.SelectTowns;
END;

EXEC dbo.InsertTown 
@TownName = 'Venezia';

GO --UPDATE--
CREATE PROCEDURE dbo.UpdateTown
(
	@NewTownName VARCHAR(50),
	@IDTown INT 
)
AS
BEGIN;
	UPDATE Town SET [Name] = @NewTownName WHERE IDTown = @IDTown;
	EXEC dbo.SelectTowns;
END;

EXEC dbo.UpdateTown
@NewTownName = 'Rialto',
@IDTown = 16;

GO --DELETE--
CREATE PROCEDURE dbo.DeleteTown
(@IDTown INT)
AS
BEGIN;
	DELETE FROM Town WHERE IDTown = @IDTown;
	EXEC dbo.SelectTowns;
END;

EXEC dbo.DeleteTown
@IDTown = 1;

-------------------------
----------ROUTE----------
-------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectRoute
AS
BEGIN;
	SELECT * FROM [Route];
END;

EXEC dbo.SelectRoute;

GO --CREATE--
CREATE PROCEDURE dbo.InsertRoute
(
	@RouteName VARCHAR (50),
	@RouteDescription VARCHAR(100)
)
AS
BEGIN;
	INSERT INTO [Route] ([Name], [Description])
	VALUES (@RouteName, @RouteDescription);
	EXEC dbo.SelectRoute;
END;

EXEC dbo.InsertRoute
@RouteName = 'Route 12',
@RouteDescription = 'From Violet to Daisy';


GO --UPDATE--
CREATE PROCEDURE dbo.UpdateRoute
(
	@RouteID INT,
	@NewRouteName VARCHAR (50),
	@NewRouteDescription VARCHAR(100)
)
AS
BEGIN;
	UPDATE [Route] SET [Name] = @NewRouteName, 
	[Description] = @NewRouteDescription
	WHERE IDRoute = @RouteID;
	EXEC dbo.SelectRoute;
END;

EXEC dbo.UpdateRoute
@RouteID = 13,
@NewRouteName = 'Route 21' ,
@NewRouteDescription = 'From Daisy to Violet';

GO --DELETE--
CREATE PROCEDURE dbo.DeleteRoute
(@IDRoute INT)
AS
BEGIN;
	DELETE FROM [Route] WHERE IDRoute = @IDRoute;
	EXEC dbo.SelectRoute;
END;

EXEC dbo.DeleteRoute
@IDRoute = 12;

---------------------------
----------JOURNEY----------
---------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectJourney
AS
BEGIN;
	SELECT * FROM Journey;
END;

EXEC dbo.SelectJourney;

GO --CREATE--
CREATE PROCEDURE dbo.InsertJourney
(@JourneyName VARCHAR(50))
AS
BEGIN;
	INSERT INTO Journey ([Name]) VALUES (@JourneyName);
	EXEC dbo.SelectJourney;
END;

EXEC dbo.InsertJourney
@JourneyName = 'Violet-Daisy';

GO --UPDATE--
CREATE PROCEDURE dbo.UpdateJourney
(
	@IDJourney INT,
	@NewJourneyName VARCHAR(50)
)
AS
BEGIN;
	UPDATE Journey SET [Name] = @NewJourneyName 
	WHERE IDJourney = @IDJourney;
	EXEC dbo.SelectJourney;
END;

EXEC dbo.UpdateJourney
@IDJourney = 13,
@NewJourneyName = 'Daisy-Violet'; 

GO --DELETE--
CREATE PROCEDURE dbo.DeleteJourney
(@IDJourney INT)
AS
BEGIN;
	DELETE FROM Journey WHERE IDJourney = @IDJourney;
	EXEC dbo.SelectJourney;
END;

EXEC dbo.DeleteJourney
@IDJourney = 12;

---------------------------
----------TYPEBUS----------
---------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectTypeBus
AS
BEGIN;
	SELECT * FROM TypeBus;
END;

EXEC dbo.SelectTypeBus;

GO --CREATE--
CREATE PROCEDURE dbo.InsertTypeBus
(@TypeBusDescription VARCHAR(100))
AS
BEGIN;
	INSERT INTO TypeBus ([Description]) 
	VALUES (@TypeBusDescription);
	EXEC dbo.SelectTypeBus;
END;

EXEC dbo.InsertTypeBus
@TypeBusDescription = 'Multiple';

GO --UPDATE--
CREATE PROCEDURE dbo.UpdateTypeBus
(
	@IDTypeBus INT,
	@TypeBusDescription VARCHAR(100)
)
AS
BEGIN;
	UPDATE TypeBus SET [Description] = @TypeBusDescription 
	WHERE IDTypeBus = @IDTypeBus;
	EXEC dbo.SelectTypeBus;
END;

EXEC dbo.UpdateTypeBus
@IDTypeBus = 7,
@TypeBusDescription = 'Simple';

GO --DELETE--
CREATE PROCEDURE dbo.DeleteTypeBus
(@IDTypeBus INT)
AS
BEGIN;
	DELETE FROM TypeBus WHERE IDTypeBus = @IDTypeBus;
	EXEC dbo.SelectTypeBus;
END;

EXEC dbo.DeleteTypeBus
@IDTypeBus = 6 ;

-----------------------
----------BUS----------
-----------------------
GO --READ--
CREATE PROCEDURE dbo.SelectBus
AS
BEGIN;
	SELECT * FROM Bus;
END;

EXEC dbo.SelectBus;

GO --CREATE--
CREATE PROCEDURE dbo.InsertBus
(
	@BusLicensePlate VARCHAR(50),
	@BusCapacity INT,
	@BusSize VARCHAR(50),
	@IDTypeBus INT,
	@IDRoute INT
)
AS
BEGIN;
	INSERT INTO Bus (licencePlate, capacity, size, IDTypeBus, IDRoute) 
	VALUES (@BusLicensePlate, @BusCapacity, @BusSize,
	@IDTypeBus, @IDRoute)
	EXEC dbo.SelectBus;
END;

EXEC dbo.InsertBus
@BusLicensePlate = 'Z5-05-09-95',
@BusCapacity = 20,
@BusSize = 'Small',
@IDTypeBus = 1,
@IDRoute = 2;

GO --UPDATE--
CREATE PROCEDURE dbo.UpdateBus
(
	@BusLicensePlate VARCHAR(50),
	@BusCapacity INT,
	@BusSize VARCHAR(50),
	@IDTypeBus INT,
	@IDRoute INT
)
AS
BEGIN;
	UPDATE Bus SET 
	capacity = @BusCapacity, size = @BusSize,
	IDTypeBus = @IDTypeBus, IDRoute = @IDRoute
	WHERE licencePlate = @BusLicensePlate;
	EXEC dbo.SelectBus;
END;

EXEC dbo.UpdateBus
@BusLicensePlate = 'Z5-05-09-95',
@BusCapacity = 25,
@BusSize = 'Small',
@IDTypeBus = 2,
@IDRoute = 3;

GO --DELETE--
CREATE PROCEDURE dbo.DeleteBus
(@BusLicensePlate VARCHAR(50))
AS
BEGIN;
	DELETE FROM Bus WHERE licencePlate = @BusLicensePlate;
	EXEC dbo.SelectBus;
END;

EXEC dbo.DeleteBus
@BusLicensePlate = 'ZS-05-09-95';

--------------------------
----------DRIVER----------
--------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectDriver
AS
BEGIN;
	SELECT * FROM Driver;
END;

EXEC dbo.SelectDriver;

GO --CREATE--
CREATE PROCEDURE dbo.InsertDriver
(
	@DriverName VARCHAR(50),
	@DriverAddress VARCHAR(100),
	@DriverTelephone varchar(50),
	@IDJourney INT
)
AS
BEGIN;
	INSERT INTO Driver ([Name], [Address], Telephone, IDJourney)
	VALUES (@DriverName, @DriverAddress, 
	@DriverTelephone, @IDJourney);
	EXEC dbo.SelectDriver;
END;

EXEC dbo.InsertDriver
@DriverName = 'Mario',
@DriverAddress = 'Mushroom Kingdom #749',
@DriverTelephone = '0147894848',
@IDJourney = 5;

GO --UPDATE--
CREATE PROCEDURE dbo.UpdateDriver
(
	@DriverID INT,
	@DriverName VARCHAR(50),
	@DriverAddress VARCHAR(100),
	@DriverTelephone varchar(50),
	@IDJourney INT
)
AS
BEGIN;
	UPDATE Driver SET [Name] = @DriverName, [Address] = @DriverAddress,
	Telephone = @DriverTelephone, IDJourney = @IDJourney
	WHERE IDDriver = @DriverID;
	EXEC dbo.SelectDriver;
END;

EXEC dbo.UpdateDriver
@DriverID = 10,
@DriverName = 'Peach',
@DriverAddress = 'Mushroom Kingdom #9',
@DriverTelephone = '1594897889',
@IDJourney = 5;


GO --DELETE--
CREATE PROCEDURE dbo.DeleteDriver
(@DriverID INT)
AS
BEGIN;
	DELETE FROM Driver WHERE IDDriver = @DriverID;
	EXEC dbo.SelectDriver;
END;

EXEC dbo.DeleteDriver
@DriverID = 10;

--------------------------
----------GARAGE----------
--------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectGarage
AS
BEGIN;
	SELECT * FROM Garage;
END;

EXEC dbo.SelectGarage;

GO --CREATE--
CREATE PROCEDURE dbo.InsertGarage
(
	@GarageName VARCHAR(50),
	@GarageCapacity INT,
	@IDTown INT
)
AS
BEGIN;
	INSERT INTO Garage ([Name], Capacity, IDTown)
	VALUES (@GarageName, @GarageCapacity, @IDTown);
	EXEC dbo.SelectGarage;
END;

EXEC dbo.InsertGarage
@GarageName = 'Hyrule Garage',
@GarageCapacity = 20,
@IDTown = 5;

GO --UPDATE--
CREATE PROCEDURE dbo.UpdateGarage
(
	@GarageID INT,
	@GarageName VARCHAR(50),
	@GarageCapacity INT,
	@IDTown INT
)
AS
BEGIN;
	UPDATE Garage SET [Name] = @GarageName, 
	Capacity = @GarageCapacity, IDTown = @IDTown
	WHERE IDGarage = @GarageID;
	EXEC dbo.SelectGarage;
END;

EXEC dbo.UpdateGarage
@GarageID = 14,
@GarageName = 'Kakariko Garage',
@GarageCapacity = 15,
@IDTown = 4;

GO --DELETE--
CREATE PROCEDURE dbo.DeleteGarage
(@GarageID INT)
AS
BEGIN;
	DELETE FROM Garage WHERE IDGarage = @GarageID;
	EXEC dbo.SelectGarage;
END;

EXEC dbo.DeleteGarage
@GarageID = 14;


----------------------------
----------ROUTELOG----------
----------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectRouteLog
AS
BEGIN;
	SELECT * FROM RouteLog;
END;

EXEC dbo.SelectRouteLog;

GO --CREATE--
CREATE PROCEDURE dbo.InsertRouteLog
(
	@RouteLogPassAverage INT,
	@RouteLogDate DATE,
	@IDRoute INT
)
AS
BEGIN;
	INSERT INTO RouteLog (passAverage, [Date], IDRoute)
	VALUES (@RouteLogPassAverage, @RouteLogDate,@IDRoute);
	EXEC dbo.SelectRouteLog;
END;

EXEC dbo.InsertRouteLog
@RouteLogPassAverage = 25,
@RouteLogDate = '2021-07-10',
@IDRoute = 5;

GO --UPDATE--
CREATE PROCEDURE dbo.UpdateRouteLog
(	
	@RouteLogID INT,
	@RouteLogPassAverage INT,
	@RouteLogDate DATE,
	@IDRoute INT
)
AS
BEGIN;
	UPDATE RouteLog SET passAverage = @RouteLogPassAverage,
	[Date] = @RouteLogDate, IDRoute = @IDRoute
	WHERE IDRouteLog = @RouteLogID;
	EXEC dbo.SelectRouteLog;
END;

EXEC dbo.UpdateRouteLog
@RouteLogID = 11,
@RouteLogPassAverage = 15,
@RouteLogDate = '2021-10-08',
@IDRoute = 6;

GO --DELETE--
CREATE PROCEDURE dbo.DeleteRouteLog
(@RouteLogID INT)
AS
BEGIN;
	DELETE FROM RouteLog WHERE IDRouteLog = @RouteLogID;
	EXEC dbo.SelectRouteLog;
END;

EXEC dbo.DeleteRouteLog
@RouteLogID = 11;

-------------------------------
----------JOURNEYTOWN----------
-------------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectJourneyTown
AS
BEGIN;
	SELECT * FROM JourneyTown;
END;

EXEC dbo.SelectJourneyTown;

GO --CREATE--
CREATE PROCEDURE dbo.InsertJourneyTown
(
	@IDTown INT,
	@IDJourney INT
)
AS
BEGIN;
	INSERT INTO JourneyTown VALUES (@IDTown, @IDJourney);
	EXEC dbo.SelectJourneyTown;
END;

EXEC dbo.InsertJourneyTown
@IDTown = 5,
@IDJourney = 6;

GO --DELETE--
CREATE PROCEDURE dbo.DeleteJourneyTown
(
	@IDTown INT,
	@IDJourney INT
)
AS
BEGIN;
	DELETE FROM JourneyTown
	WHERE IDTown = @IDTown AND IDJourney = @IDJourney;
	EXEC dbo.SelectJourneyTown;
END;

EXEC dbo.DeleteJourneyTown
@IDTown = 1,
@IDJourney = 2;

--------------------------------
----------ROUTEJOURNEY----------
--------------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectRouteJourney
AS
BEGIN;
	SELECT * FROM RouteJourney;
END;

EXEC dbo.SelectRouteJourney;

GO --CREATE--
CREATE PROCEDURE dbo.InsertRouteJourney
(
	@IDRoute INT,
	@IDJourney INT
)
AS
BEGIN;
	INSERT INTO RouteJourney VALUES (@IDRoute, @IDJourney);
	EXEC dbo.SelectRouteJourney;
END;

EXEC dbo.InsertRouteJourney
@IDRoute = 1,
@IDJourney = 10;

GO --DELETE--
CREATE PROCEDURE dbo.DeleteRouteJourney
(
	@IDRoute INT,
	@IDJourney INT
)
AS
BEGIN;
	DELETE FROM RouteJourney
	WHERE IDRoute = @IDRoute AND IDJourney = @IDJourney;
	EXEC dbo.SelectRouteJourney;
END;

EXEC dbo.DeleteRouteJourney
@IDRoute = 1,
@IDJourney = 10;