----------------------- -----TESTING FILE-----------------------------

USE Bus;
----------------------------------------------------------------------
--------------------------------DRIVER--------------------------------
----------------------------------------------------------------------
GO --READ--

EXEC dbo.SelectDriver;

GO --CREATE--

EXEC dbo.InsertDriver
@DriverName = 'Mario',
@DriverAddress = 'Mushroom Kingdom #749',
@DriverTelephone = '0147894848',
@IDJourney = 5;

EXEC dbo.InsertDriver
@DriverName = 'Peach',
@DriverAddress = 'Mushroom Kingdom #59',
@DriverTelephone = '14789498763',
@IDJourney = 10;

EXEC dbo.InsertDriver
@DriverName = 'Link',
@DriverAddress = 'Hyrule Avenue #15',
@DriverTelephone = '9586521549',
@IDJourney = 9;

EXEC dbo.InsertDriver
@DriverName = 'Zelda',
@DriverAddress = 'Hyrule Avenue #15-B',
@DriverTelephone = '1594892635',
@IDJourney = 4;

GO --UPDATE--

EXEC dbo.UpdateDriver
@DriverID = 10,
@DriverName = 'Luigi',
@DriverAddress = 'Mushroom Kingdom #9',
@DriverTelephone = '1594897889',
@IDJourney = 3;

EXEC dbo.UpdateDriver
@DriverID = 11,
@DriverName = 'Daisy',
@DriverAddress = 'Mushroom Kingdom #1099',
@DriverTelephone = '7487878945',
@IDJourney = 5;

EXEC dbo.UpdateDriver
@DriverID = 12,
@DriverName = 'Ganon',
@DriverAddress = 'Hyrule Avenue #999',
@DriverTelephone = '1524584545',
@IDJourney = 5;

EXEC dbo.UpdateDriver
@DriverID = 13,
@DriverName = 'Impa',
@DriverAddress = 'Hyrule Avenue #56-D',
@DriverTelephone = '0320360101',
@IDJourney = 1;

GO --DELETE--

EXEC dbo.DeleteDriver
@DriverID = 1;

EXEC dbo.DeleteDriver
@DriverID = 5;

EXEC dbo.DeleteDriver
@DriverID = 3;

EXEC dbo.DeleteDriver
@DriverID = 11;

----------------------------------------------------------------------
--------------------------------GARAGE--------------------------------
----------------------------------------------------------------------
GO --READ--

EXEC dbo.SelectGarage;

GO --CREATE--

EXEC dbo.InsertGarage
@GarageName = 'Hyrule Garage',
@GarageCapacity = 25,
@IDTown = 1;

EXEC dbo.InsertGarage
@GarageName = 'Mushroom Garage',
@GarageCapacity = 20,
@IDTown = 3;

EXEC dbo.InsertGarage
@GarageName = 'Castle Garage',
@GarageCapacity = 30,
@IDTown = 5;

EXEC dbo.InsertGarage
@GarageName = 'Hollow Garage',
@GarageCapacity = 8,
@IDTown = 8;

GO --UPDATE--

EXEC dbo.UpdateGarage
@GarageID = 14,
@GarageName = 'Kakariko Garage',
@GarageCapacity = 15,
@IDTown = 4;

EXEC dbo.UpdateGarage
@GarageID = 15,
@GarageName = 'Bob Garage',
@GarageCapacity = 10,
@IDTown = 4;

EXEC dbo.UpdateGarage
@GarageID = 16,
@GarageName = 'Ashe Garage',
@GarageCapacity = 15,
@IDTown = 5;

EXEC dbo.UpdateGarage
@GarageID = 17,
@GarageName = 'Ana Garage',
@GarageCapacity = 9,
@IDTown = 9;

GO --DELETE--

EXEC dbo.DeleteGarage
@GarageID = 1;

EXEC dbo.DeleteGarage
@GarageID = 5;

EXEC dbo.DeleteGarage
@GarageID = 11;

EXEC dbo.DeleteGarage
@GarageID = 6;

----------------------------------------------------------------------
-------------------------------ROUTELOG-------------------------------
----------------------------------------------------------------------
GO --READ--

EXEC dbo.SelectRouteLog;

GO --CREATE--

EXEC dbo.InsertRouteLog
@RouteLogPassAverage = 25,
@RouteLogDate = '2021-07-09',
@IDRoute = 9;

EXEC dbo.InsertRouteLog
@RouteLogPassAverage = 20,
@RouteLogDate = '2021-08-09',
@IDRoute = 8;

EXEC dbo.InsertRouteLog
@RouteLogPassAverage = 19,
@RouteLogDate = '2021-10-10',
@IDRoute = 1;

EXEC dbo.InsertRouteLog
@RouteLogPassAverage = 10,
@RouteLogDate = '2021-10-10',
@IDRoute = 3;

GO --UPDATE--

EXEC dbo.UpdateRouteLog
@RouteLogID = 1,
@RouteLogPassAverage = 10,
@RouteLogDate = '2021-07-02',
@IDRoute = 6;

EXEC dbo.UpdateRouteLog
@RouteLogID = 8,
@RouteLogPassAverage = 5,
@RouteLogDate = '2021-10-12',
@IDRoute = 1;


EXEC dbo.UpdateRouteLog
@RouteLogID = 11,
@RouteLogPassAverage = 15,
@RouteLogDate = '2021-10-08',
@IDRoute = 5;

EXEC dbo.UpdateRouteLog
@RouteLogID = 14,
@RouteLogPassAverage = 20,
@RouteLogDate = '2021-06-05',
@IDRoute = 9;


GO --DELETE--

EXEC dbo.DeleteRouteLog
@RouteLogID = 1;

EXEC dbo.DeleteRouteLog
@RouteLogID = 10;

EXEC dbo.DeleteRouteLog
@RouteLogID = 13;

EXEC dbo.DeleteRouteLog
@RouteLogID = 9;
----------------------------------------------------------------------
---------------------------------BUS----------------------------------
----------------------------------------------------------------------
GO --READ--

EXEC dbo.SelectBus;

GO --CREATE--

EXEC dbo.InsertBus
@BusLicensePlate = 'Z5-05-09-95',
@BusCapacity = 20,
@BusSize = 'Small',
@IDTypeBus = 1,
@IDRoute = 2;

EXEC dbo.InsertBus
@BusLicensePlate = 'AB-CD-12-34',
@BusCapacity = 30,
@BusSize = 'Large',
@IDTypeBus = 3,
@IDRoute = 6;

EXEC dbo.InsertBus
@BusLicensePlate = 'D9-D4-A1-K8',
@BusCapacity = 18,
@BusSize = 'Medium',
@IDTypeBus = 4,
@IDRoute = 9;

EXEC dbo.InsertBus
@BusLicensePlate = 'P0-5X-Z9-O9',
@BusCapacity = 35,
@BusSize = 'Large',
@IDTypeBus = 3,
@IDRoute = 6;

GO --UPDATE--

EXEC dbo.UpdateBus
@BusLicensePlate = 'Z5-05-09-95',
@BusCapacity = 10,
@BusSize = 'Small',
@IDTypeBus = 2,
@IDRoute = 3;

EXEC dbo.UpdateBus
@BusLicensePlate = 'AJ-85-4H-RO',
@BusCapacity = 15,
@BusSize = 'Medium',
@IDTypeBus = 4,
@IDRoute = 6;

EXEC dbo.UpdateBus
@BusLicensePlate = 'QW-RE-12-34',
@BusCapacity = 25,
@BusSize = 'Medium',
@IDTypeBus = 2,
@IDRoute = 3;

EXEC dbo.UpdateBus
@BusLicensePlate = 'BL-85-6J-FG',
@BusCapacity = 35,
@BusSize = 'Large',
@IDTypeBus = 4,
@IDRoute = 8;


GO --DELETE--

EXEC dbo.DeleteBus
@BusLicensePlate = 'BL-85-6J-FG';

EXEC dbo.DeleteBus
@BusLicensePlate = 'D9-D4-A1-K8';

EXEC dbo.DeleteBus
@BusLicensePlate = 'AJ-85-4H-RO';

EXEC dbo.DeleteBus
@BusLicensePlate = 'VZ-11-ZA-5D';


----------------------------------------------------------------------
-------------------------------TYPEBUS--------------------------------
----------------------------------------------------------------------
GO --READ--

EXEC dbo.SelectTypeBus;

GO --CREATE--

EXEC dbo.InsertTypeBus
@TypeBusDescription = 'Multiple';

EXEC dbo.InsertTypeBus
@TypeBusDescription = 'VIP Security';

EXEC dbo.InsertTypeBus
@TypeBusDescription = 'Mega';

EXEC dbo.InsertTypeBus
@TypeBusDescription = 'Simple';

GO --UPDATE--

EXEC dbo.UpdateTypeBus
@IDTypeBus = 7,
@TypeBusDescription = 'VIP 2nd';

EXEC dbo.UpdateTypeBus
@IDTypeBus = 1,
@TypeBusDescription = 'Normal deck';

EXEC dbo.UpdateTypeBus
@IDTypeBus = 4,
@TypeBusDescription = 'Super bus';

EXEC dbo.UpdateTypeBus
@IDTypeBus = 8,
@TypeBusDescription = 'Beta';

GO --DELETE--

EXEC dbo.DeleteTypeBus
@IDTypeBus = 4;

EXEC dbo.DeleteTypeBus
@IDTypeBus = 2;

EXEC dbo.DeleteTypeBus
@IDTypeBus = 8;

EXEC dbo.DeleteTypeBus
@IDTypeBus = 1;

----------------------------------------------------------------------
-----------------------------JOURNEYTOWN------------------------------
----------------------------------------------------------------------
GO --READ--

EXEC dbo.SelectJourneyTown;

GO --CREATE--

EXEC dbo.InsertJourneyTown
@IDTown = 5,
@IDJourney = 6;

EXEC dbo.InsertJourneyTown
@IDTown = 6,
@IDJourney = 1;

EXEC dbo.InsertJourneyTown
@IDTown = 2,
@IDJourney = 1;

EXEC dbo.InsertJourneyTown
@IDTown = 9,
@IDJourney = 8;

GO --DELETE--

EXEC dbo.DeleteJourneyTown
@IDTown = 1,
@IDJourney = 2;

EXEC dbo.DeleteJourneyTown
@IDTown = 3,
@IDJourney = 8;

EXEC dbo.DeleteJourneyTown
@IDTown = 6,
@IDJourney = 1;

EXEC dbo.DeleteJourneyTown
@IDTown = 9,
@IDJourney = 8;
----------------------------------------------------------------------
--------------------------------TOWN----------------------------------
----------------------------------------------------------------------
GO --READ--

EXEC dbo.SelectTowns;

GO --CREATE--

EXEC dbo.InsertTown 
@TownName = 'Venezia';

EXEC dbo.InsertTown 
@TownName = 'Rialto';

EXEC dbo.InsertTown 
@TownName = 'Abacchio';

EXEC dbo.InsertTown 
@TownName = 'Bucciarati';

GO --UPDATE--

EXEC dbo.UpdateTown
@NewTownName = 'Florencia',
@IDTown = 1;

EXEC dbo.UpdateTown
@NewTownName = 'Roma',
@IDTown = 13;

EXEC dbo.UpdateTown
@NewTownName = 'Napoles',
@IDTown = 3;

EXEC dbo.UpdateTown
@NewTownName = 'Genova',
@IDTown = 7;

GO --DELETE--

EXEC dbo.DeleteTown
@IDTown = 1;

EXEC dbo.DeleteTown
@IDTown = 2;

EXEC dbo.DeleteTown
@IDTown = 6;

EXEC dbo.DeleteTown
@IDTown = 14;

----------------------------------------------------------------------
-----------------------------ROUTEJOURNEY-----------------------------
----------------------------------------------------------------------
GO --READ--

EXEC dbo.SelectRouteJourney;

GO --CREATE--

EXEC dbo.InsertRouteJourney
@IDRoute = 3,
@IDJourney = 5;

EXEC dbo.InsertRouteJourney
@IDRoute = 2,
@IDJourney = 10;

EXEC dbo.InsertRouteJourney
@IDRoute = 10,
@IDJourney = 1;

EXEC dbo.InsertRouteJourney
@IDRoute = 1,
@IDJourney = 10;

GO --DELETE--

EXEC dbo.DeleteRouteJourney
@IDRoute = 2,
@IDJourney = 2;

EXEC dbo.DeleteRouteJourney
@IDRoute = 3,
@IDJourney = 5;

EXEC dbo.DeleteRouteJourney
@IDRoute = 5,
@IDJourney = 5;

EXEC dbo.DeleteRouteJourney
@IDRoute = 10,
@IDJourney = 1;

----------------------------------------------------------------------
-------------------------------JOURNEY--------------------------------
----------------------------------------------------------------------
GO --READ--

EXEC dbo.SelectJourney;

GO --CREATE--

EXEC dbo.InsertJourney
@JourneyName = 'Florencia-Roma';

EXEC dbo.InsertJourney
@JourneyName = 'Roma-Napoles';

EXEC dbo.InsertJourney
@JourneyName = 'Napoles-Genova';

EXEC dbo.InsertJourney
@JourneyName = 'Rialto-Venezia';

GO --UPDATE--

EXEC dbo.UpdateJourney
@IDJourney = 13,
@NewJourneyName = 'Rialto-Violet'; 

EXEC dbo.UpdateJourney
@IDJourney = 1,
@NewJourneyName = 'Daisy-Venezia'; 

EXEC dbo.UpdateJourney
@IDJourney = 5,
@NewJourneyName = 'Venezia-Genova'; 

EXEC dbo.UpdateJourney
@IDJourney = 9,
@NewJourneyName = 'Napoles-Roma'; 

GO --DELETE--

EXEC dbo.DeleteJourney
@IDJourney = 9;

EXEC dbo.DeleteJourney
@IDJourney = 7;

EXEC dbo.DeleteJourney
@IDJourney = 11;

EXEC dbo.DeleteJourney
@IDJourney = 2;

----------------------------------------------------------------------
--------------------------------ROUTE---------------------------------
----------------------------------------------------------------------
GO --READ--

EXEC dbo.SelectRoute;

GO --CREATE--

EXEC dbo.InsertRoute
@RouteName = 'Route 12',
@RouteDescription = 'From Napoles to Roma';

EXEC dbo.InsertRoute
@RouteName = 'Route 13',
@RouteDescription = 'From Daisy to Venezia';

EXEC dbo.InsertRoute
@RouteName = 'Route 14',
@RouteDescription = 'From Venezia to Genova';

EXEC dbo.InsertRoute
@RouteName = 'Route 15',
@RouteDescription = 'From Florencia to Roma';

GO --UPDATE--

EXEC dbo.UpdateRoute
@RouteID = 13,
@NewRouteName = 'Route 21' ,
@NewRouteDescription = 'From Daisy to Violet';

EXEC dbo.UpdateRoute
@RouteID = 1,
@NewRouteName = 'Route 22' ,
@NewRouteDescription = 'From Roma to Violet';

EXEC dbo.UpdateRoute
@RouteID = 15,
@NewRouteName = 'Route 23' ,
@NewRouteDescription = 'From Daisy to Florencia';

EXEC dbo.UpdateRoute
@RouteID = 6,
@NewRouteName = 'Route 24' ,
@NewRouteDescription = 'From Venezia to Napoles';

GO --DELETE--

EXEC dbo.DeleteRoute
@IDRoute = 4;

EXEC dbo.DeleteRoute
@IDRoute = 6;

EXEC dbo.DeleteRoute
@IDRoute = 15;

EXEC dbo.DeleteRoute
@IDRoute = 8;











