---------------------------CRUD OPERATIONS----------------------------

USE Bus;

----------------------------------------------------------------------
--------------------------------DRIVER--------------------------------
----------------------------------------------------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectDriver
AS
BEGIN;
	SELECT * FROM Driver;
END;

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

GO --DELETE--
CREATE PROCEDURE dbo.DeleteDriver
(@DriverID INT)
AS
BEGIN;
	DELETE FROM Driver WHERE IDDriver = @DriverID;
	EXEC dbo.SelectDriver;
END;

----------------------------------------------------------------------
--------------------------------GARAGE--------------------------------
----------------------------------------------------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectGarage
AS
BEGIN;
	SELECT * FROM Garage;
END;


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

GO --DELETE--
CREATE PROCEDURE dbo.DeleteGarage
(@GarageID INT)
AS
BEGIN;
	DELETE FROM Garage WHERE IDGarage = @GarageID;
	EXEC dbo.SelectGarage;
END;

----------------------------------------------------------------------
-------------------------------ROUTELOG-------------------------------
----------------------------------------------------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectRouteLog
AS
BEGIN;
	SELECT * FROM RouteLog;
END;

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

GO --DELETE--
CREATE PROCEDURE dbo.DeleteRouteLog
(@RouteLogID INT)
AS
BEGIN;
	DELETE FROM RouteLog WHERE IDRouteLog = @RouteLogID;
	EXEC dbo.SelectRouteLog;
END;

----------------------------------------------------------------------
---------------------------------BUS----------------------------------
----------------------------------------------------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectBus
AS
BEGIN;
	SELECT * FROM Bus;
END;


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

GO --DELETE--
CREATE PROCEDURE dbo.DeleteBus
(@BusLicensePlate VARCHAR(50))
AS
BEGIN;
	DELETE FROM Bus WHERE licencePlate = @BusLicensePlate;
	EXEC dbo.SelectBus;
END;

----------------------------------------------------------------------
-------------------------------TYPEBUS--------------------------------
----------------------------------------------------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectTypeBus
AS
BEGIN;
	SELECT * FROM TypeBus;
END;


GO --CREATE--
CREATE PROCEDURE dbo.InsertTypeBus
(@TypeBusDescription VARCHAR(100))
AS
BEGIN;
	INSERT INTO TypeBus ([Description]) 
	VALUES (@TypeBusDescription);
	EXEC dbo.SelectTypeBus;
END;


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

GO --DELETE--
CREATE PROCEDURE dbo.DeleteTypeBus
(@IDTypeBus INT)
AS
BEGIN;
	DELETE FROM Bus WHERE IDTypeBus = @IDTypeBus;
	DELETE FROM TypeBus WHERE IDTypeBus = @IDTypeBus;
	EXEC dbo.SelectBus;
	EXEC dbo.SelectTypeBus;
END;

----------------------------------------------------------------------
-----------------------------JOURNEYTOWN------------------------------
----------------------------------------------------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectJourneyTown
AS
BEGIN;
	SELECT * FROM JourneyTown;
END;


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

----------------------------------------------------------------------
--------------------------------TOWN----------------------------------
----------------------------------------------------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectTowns
AS
BEGIN;
	SELECT * FROM Town;
END;

GO --CREATE--
CREATE PROCEDURE dbo.InsertTown
(@TownName VARCHAR(50))
AS
BEGIN;
	INSERT INTO Town ([Name]) VALUES (@TownName);
	EXEC dbo.SelectTowns;
END;

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

GO --DELETE--
CREATE PROCEDURE dbo.DeleteTown
(@IDTown INT)
AS
BEGIN;
	DELETE FROM Garage WHERE IDTown = @IDTown;
	DELETE FROM JourneyTown WHERE IDTown = @IDTown;
	DELETE FROM Town WHERE IDTown = @IDTown;
	EXEC dbo.SelectTowns;
	EXEC dbo.SelectGarage;
	EXEC dbo.SelectJourneyTown;
END;

----------------------------------------------------------------------
-----------------------------ROUTEJOURNEY-----------------------------
----------------------------------------------------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectRouteJourney
AS
BEGIN;
	SELECT * FROM RouteJourney;
END;

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

----------------------------------------------------------------------
-------------------------------JOURNEY--------------------------------
----------------------------------------------------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectJourney
AS
BEGIN;
	SELECT * FROM Journey;
END;

GO --CREATE--
CREATE PROCEDURE dbo.InsertJourney
(@JourneyName VARCHAR(50))
AS
BEGIN;
	INSERT INTO Journey ([Name]) VALUES (@JourneyName);
	EXEC dbo.SelectJourney;
END;
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

GO --DELETE--
CREATE PROCEDURE dbo.DeleteJourney
(@IDJourney INT)
AS
BEGIN;
	DELETE FROM JourneyTown WHERE IDJourney = @IDJourney;
	DELETE FROM RouteJourney WHERE IDJourney = @IDJourney;
	DELETE FROM Driver WHERE IDJourney = @IDJourney;
	DELETE FROM Journey WHERE IDJourney = @IDJourney;
	EXEC dbo.SelectJourney;
	EXEC dbo.SelectJourneyTown;
	EXEC dbo.SelectRouteJourney;
	EXEC dbo.SelectDriver;
END;

----------------------------------------------------------------------
--------------------------------ROUTE---------------------------------
----------------------------------------------------------------------
GO --READ--
CREATE PROCEDURE dbo.SelectRoute
AS
BEGIN;
	SELECT * FROM [Route];
END;

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

GO --DELETE--
CREATE PROCEDURE dbo.DeleteRoute
(@IDRoute INT)
AS
BEGIN;
	DELETE FROM RouteJourney WHERE IDRoute = @IDRoute;
	DELETE FROM RouteLog WHERE IDRoute = @IDRoute;
	DELETE FROM Bus WHERE IDRoute = @IDRoute;
	DELETE FROM [Route] WHERE IDRoute = @IDRoute;
	EXEC dbo.SelectRoute;
	EXEC dbo.SelectRouteJourney;
	EXEC dbo.SelectRouteLog;
	EXEC dbo.SelectBus;
END;