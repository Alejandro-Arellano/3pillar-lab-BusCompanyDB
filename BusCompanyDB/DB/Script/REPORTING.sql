---------------REPORTING FILE---------------------
USE Bus;

--- 1 HOW MANY JOURNEYS DOESNT HAVE AN ASSIGNED DRIVER
SELECT COUNT(J.[Name]) AS NumberJourneys FROM Journey J
LEFT JOIN Driver D
ON J.IDJourney = D.IDJourney
WHERE D.IDJourney IS NULL;

--- 2 WHAT TOWNS DOESNT HAVE A GARAGE
SELECT T.[Name]
FROM Garage G RIGHT JOIN TOWN T 
ON G.IDTown = T.IDTown
WHERE G.IDTown IS NULL;

--- 3 SHOW THE COMPARITION OF THE CAPACITY OF EVERY BUS TO THE AVERAGE OF PASSANGERS THEY HAVE ON THE ROUTE LOG
SELECT B.licencePlate, B.capacity, RL.passAverage, RL.[Date] FROM Bus B
JOIN [Route] R
ON B.IDRoute = R.IDRoute
JOIN RouteLog RL
ON R.IDRoute = RL.IDRoute;

--- 4 HOW MANY BUSES ARE IN EACH GARAGE AND NAME THEM
SELECT G.[Name], COUNT(B.size) AS TotalBuses FROM Bus B
JOIN [Route] R
ON B.IDRoute = R.IDRoute
JOIN RouteJourney RJ
ON R.IDRoute = RJ.IDRoute
JOIN Journey J
ON RJ.IDJourney = J.IDJourney
JOIN JourneyTown JT
ON J.IDJourney = JT.IDJourney
JOIN Town T
ON JT.IDTown = T.IDTown
JOIN Garage G
ON T.IDTown = G.IDTown
GROUP BY G.[Name];

--- 5 BUSES THAT PASSES THROUGH EACH ROUTE
SELECT B.licencePlate, R.[Name], R.[Description] FROM Bus B
RIGHT JOIN [Route] R
ON B.IDRoute = R.IDRoute
ORDER BY R.[Name] ASC;

--- 6 WHICH DRIVERS GO THROUGH WHICH ROUTE
SELECT R.[Name], D.[Name] FROM [Route] R
JOIN RouteJourney RJ
ON R.IDRoute = RJ.IDRoute
JOIN Journey J
ON RJ.IDJourney = J.IDJourney
JOIN Driver D
ON J.IDJourney = D.IDJourney
ORDER BY R.[Name];

--- 7 HOW MANY DRIVERS GOES THROUGH EACH ROUTE
SELECT R.[Name], COUNT(D.[Name]) AS NumberOFDrivers FROM [Route] R
LEFT JOIN RouteJourney RJ
ON R.IDRoute = RJ.IDRoute
LEFT JOIN Journey J
ON RJ.IDJourney = J.IDJourney
LEFT JOIN Driver D
ON J.IDJourney = D.IDJourney
GROUP BY R.[Name];

--- 8 WHICH TYPE OF BUS GOES THROUGH EACH TOWN AND TOWNS THAT DOESNT HAVE BUSES
SELECT T.[Name], TB.[Description] FROM TypeBus TB
RIGHT JOIN Bus B
ON B.IDTypeBus = tb.IDTypeBus
RIGHT JOIN [Route] R
ON B.IDRoute = R.IDRoute
RIGHT JOIN RouteJourney RJ
ON R.IDRoute = RJ.IDRoute
RIGHT JOIN Journey J
ON RJ.IDJourney = J.IDJourney
RIGHT JOIN JourneyTown JT
ON J.IDJourney = JT.IDJourney
RIGHT JOIN Town T
ON JT.IDTown = T.IDTown;

--- 9 WHICH BUSES WENT TO THEIR ROUTE IN AUGUST
SELECT B.licencePlate, R.[Name], RL.[Date] FROM RouteLog RL
JOIN [Route] R
ON R.IDRoute = RL.IDRoute
JOIN Bus B
ON R.IDRoute = B.IDRoute
WHERE RL.[Date] BETWEEN '2021-08-01' AND '2021-08-31';

--- 10 NUMBER OF DRIVERS WHO DRIVE VIP BUSES
SELECT TB.[Description] AS TypeOfBus, COUNT(D.[Name]) AS NumberOfDrivers FROM TypeBus TB
 JOIN Bus B
ON B.IDTypeBus = tb.IDTypeBus
 JOIN [Route] R
ON B.IDRoute = R.IDRoute
 JOIN RouteJourney RJ
ON R.IDRoute = RJ.IDRoute
 JOIN Journey J
ON RJ.IDJourney = J.IDJourney
 JOIN Driver D
ON J.IDJourney = D.IDJourney
GROUP BY TB.[Description]
HAVING TB.[Description] = 'VIP';

--- 11 AVERAGE OF PASSANGERS OF EACH ROUTE
SELECT R.[Name], AVG(passAverage) AS AVGOfPass FROM [Route] R
LEFT JOIN RouteLog RL
ON R.IDRoute = RL.IDRoute
GROUP BY R.[Name];

--- 12 WHICH ROUTES GOES THROUGH WHICH TOWN AND SHOW IF THERE ARE TOWNS WITH NO ROUTES
SELECT R.[Name], T.[Name] FROM  [Route] R
RIGHT JOIN RouteJourney RJ
ON R.IDRoute = RJ.IDRoute
RIGHT JOIN Journey J
ON RJ.IDJourney = J.IDJourney
RIGHT JOIN JourneyTown JT
ON J.IDJourney = JT.IDJourney
RIGHT JOIN Town T
ON JT.IDTown = T.IDTown
ORDER BY R.[Name];

--- 13 DRIVERS THAT WORKED IN SEPTEMBER
SELECT D.[Name] AS DriverName, R.[Name] AS RouteName, RL.[Date] FROM Driver D
JOIN Journey J
ON D.IDJourney = J.IDJourney
JOIN RouteJourney RJ
ON J.IDJourney = RJ.IDJourney
JOIN [Route] R
ON RJ.IDRoute = R.IDRoute
JOIN RouteLog RL
ON R.IDRoute = RL.IDRoute
WHERE RL.[Date] BETWEEN '2021-09-01' AND '2021-09-30';

--- 14 WHAT TYPE OF BUS GOES THROUGH EACH ROUTE
SELECT R.[Name], TB.[Description], R.[Description] FROM TypeBus TB
JOIN Bus B
ON TB.IDTypeBus = B.IDTypeBus
JOIN [Route] R
ON B.IDRoute = R.IDRoute
ORDER BY R.[Name];

--- 15 SHOW THE TOWN WITH MOST DRIVERS THAT PASS THROUGH
SELECT MAX(driverCount.TownName) AS TownName, MAX(driverCount.[max]) AS NumberOfDrivers
FROM
(
SELECT T.[Name] AS TownName, COUNT(T.[Name]) AS [Max] FROM Town T
JOIN JourneyTown JT
ON T.IDTown = JT.IDTown
JOIN Journey J
ON JT.IDJourney = J.IDJourney
JOIN Driver D
ON J.IDJourney = D.IDJourney
GROUP BY T.[Name]) AS driverCount;


 ------- VIEWS -------
--- VIEW NAME OF GARAGE AND LOCATION
GO
CREATE VIEW GarageLocations AS 
SELECT G.[Name] AS GARAGE_NAME, T.[Name] AS TOWN_NAME 
FROM Garage G JOIN TOWN T 
ON G.IDTown = T.IDTown;
GO

SELECT * FROM GarageLocations;

--- VIEW BUSES AND THEIR TYPES
GO
CREATE VIEW BusesAndTypes AS
SELECT B.licencePlate, B.capacity, B.size, TB.[Description] FROM Bus B
JOIN TypeBus TB
ON B.IDTypeBus = TB.IDTypeBus;
GO

SELECT * FROM BusesAndTypes;

--- VIEW DRIVERS ASSIGNED TO THEIR JOURNEYS AND ROUTES
GO
CREATE VIEW DriverJourney AS
SELECT D.[Name] AS DriverName, J.[Name] AS JourneyName, R.[Name] AS RouteName FROM Driver D
JOIN Journey J
ON D.IDJourney = J.IDJourney
JOIN RouteJourney RJ
ON J.IDJourney = RJ.IDJourney
JOIN [Route] R
ON RJ.IDRoute = R.IDRoute;
GO

SELECT * FROM DriverJourney;

--- VIEW BUSES AND THEIR ROUTES
GO
CREATE VIEW BusesAndRoutes AS
SELECT B.licencePlate, R.[Name], R.[Description] FROM Bus B
JOIN [Route] R
ON B.IDRoute = R.IDRoute;
GO

SELECT * FROM BusesAndRoutes;

--- VIEW WHICH BUSES ARE IN WHICH GARAGE
GO
CREATE VIEW BusesAndGarageTown AS
SELECT B.licencePlate, T.[Name] AS TownName, 
G.[Name] AS GarageName FROM Bus B
JOIN [Route] R
ON B.IDRoute = R.IDRoute
JOIN RouteJourney RJ
ON R.IDRoute = RJ.IDRoute
JOIN Journey J
ON RJ.IDJourney = J.IDJourney
JOIN JourneyTown JT
ON J.IDJourney = JT.IDJourney
JOIN Town T
ON JT.IDTown = T.IDTown
JOIN Garage G
ON T.IDTown = G.IDTown;
GO

SELECT * FROM BusesAndGarageTown;