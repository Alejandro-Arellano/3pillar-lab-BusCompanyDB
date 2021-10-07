USE Bus;
GO

INSERT INTO Town VALUES
('Violet'),
('Mint'),
('Lavender'),
('Carnation'),
('Vinca'),
('Ribbon'),
('Daisy'),
('Sunflower'),
('Rose'),
('Sanservia');

INSERT INTO [Route] VALUES
('Route 01','From Violet to Mint'),
('Route 02','From Violet to Carnation'),
('Route 03','From Mint to Daisy'),
('Route 04','From Lavender to Sunflower'),
('Route 05','From Vinca to Rose'),
('Route 06','From Ribbon to Lavender'),
('Route 07','From Daisy to Sanservia'),
('Route 08','From Sunflower to Daisy'),
('Route 09','From Sunflower to Sanservia'),
('Route 10','From Rose to Lavender'),
('Route 11','From Carnation to Daisy');

INSERT INTO Journey VALUES
('Violet-Mint'),
('Violet-Carnation'),
('Mint-Daisy'),
('Lavender-Sunflower'),
('Vinca-Rose'),
('Ribbon-Lavender'),
('Daisy-Sanservia'),
('Sunflower-Daisy'),
('Sunflower-Sanservia'),
('Rose-Lavender'),
('Carnation-Daisy');

INSERT INTO TypeBus VALUES
('Single deck'),
('Double deck'),
('Triple deck'),
('VIP'),
('Basic');

INSERT INTO Bus VALUES
('MI-LS-41-65', 15, 'Small', 1, 7),
('CG-63-2S-RO', 35, 'Large', 3, 6),
('AJ-85-4H-RO', 15, 'Small', 5, 5),
('BC-06-7H-PJ', 25, 'Medium', 2, 2),
('BL-85-6J-FG', 25, 'Medium', 2, 1),
('MN-58-59-DF', 35, 'Large', 3, 4),
('QW-RE-12-34', 15, 'Small', 5, 11),
('WQ-ER-721-43', 20, 'Medium', 4, 8),
('VZ-11-ZA-5D', 20, 'Medium', 4, 1);

INSERT INTO Garage VALUES
('Violet Garage', 15, 1),
('Violet 2nd Garage', 20, 1),
('Violet 3th Garage', 9, 1),
('Mint Garage', 10, 2),
('Lavender Garage', 20, 3),
('White Carnation Garage', 8, 4),
('Pink Carnation Garage', 10, 4),
('Vinca Garage', 10, 5),
('Ribbon Garage', 15, 6),
('Purple Daisy Garage', 5, 7),
('White Daisy Garage', 10, 7),
('Sunflower Garage', 20, 8),
('Sanservia Garage', 8, 10);

INSERT INTO Driver VALUES
('Giorno', 'Via del Corso #200', 4891478917, 1),
('Guido', 'La Mercerie #5061', 1524784154, 2),
('Luigi', 'Via Rizzoli #104', 1984568202, 4),
('Mariella', 'Siena #34-B', 1234561789, 3),
('Stella', 'Pescara #1057', 9995724205, 6),
('Alessia', 'Via Rialto #1590', 3652451489, 5),
('Dante', 'Stabilimento #590', 1021547896, 7),
('Virgilio', 'Basso #54-D', 1784572320, 8),
('Bianca', 'Carrozzeria #1057', 1784568978, 11);

INSERT INTO RouteLog VALUES
(30,'07-01-2021', 1),
(15,'07-15-2021', 9),
(7,'07-30-2021', 10),
(29,'08-16-2021', 4),
(14,'08-29-2021', 3),
(15,'08-30-2021', 7),
(30,'09-01-2021', 3),
(17,'10-02-2021', 1),
(20,'10-06-2021', 8),
(30,'10-07-2021', 6);

INSERT INTO JourneyTown VALUES
(1,2),
(1,4),
(2,7),
(3,8),
(5,9),
(6,3),
(7,10),
(8,7),
(8,10),
(9,3),
(4,7);

INSERT INTO RouteJourney VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);
