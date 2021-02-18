-- CREATE, INSERT, UPDATE, DELETE


-- Datenbank erstellen:
CREATE DATABASE Demo01

-- DROP DATABASE Demo01 -- ACHTUNG: L�scht gesamte DB inklusive Inhalt!!

-- wichtig: DIESE DB verwenden, um Tabellen in DIESER DB anzulegen
USE Demo01


-- Tabelle erstellen:
CREATE TABLE Produkte (
							ProduktID int identity(1, 1) PRIMARY KEY, -- identity macht auch NOT NULL und UNIQUE
							ProduktName nvarchar(50),
							Preis money
							-- ...
							-- ...
						)


-- Daten in Tabelle einf�gen:

-- nicht so sch�n!!
INSERT INTO Produkte
VALUES ('Spaghetti', 1.99)

-- besser:
-- IMMER dazuschreiben, in welche Spalten welche Informationen geh�ren:
INSERT INTO Produkte (ProduktName, Preis)
VALUES ('Spaghetti', 1.99)

-- dann m�ssen die Eintr�ge auch nicht in der Reihenfolge erfolgen, wie die Tabelle erstellt worden ist
INSERT INTO Produkte (Preis, ProduktName)
VALUES (1.99, 'Spaghetti')


-- mehrere Produkte auf einmal einf�gen:
INSERT INTO Produkte (Preis, ProduktName)
VALUES	  (1.99, 'Spaghetti')
		, (4.99, 'Profiterols')
		, (5.99, 'Tiramisu')
		, (5.89, 'Pizza Margherita')
		, (6.99, 'Pizza Tonno')
		, (3.99, 'Limoncello')



-- Werte ver�ndern mit UPDATE:

UPDATE Produkte
SET Preis = 5.30
WHERE ProduktID = 6
-- ACHTUNG: IMMER mit WHERE eingrenzen, sonst wird der Wert ALLER Produkte auf 5.30 gesetzt!!



-- ACHTUNG beim L�schen:
-- DROP l�scht gesamte Tabelle inklusive Inhalt!!
-- DELETE FROM Tabelle l�scht GESAMTEN Inhalt der Tabelle
-- IMMER mit WHERE einschr�nken!!!

-- etwas rausl�schen:
DELETE FROM Produkte
WHERE ProduktID = 3



-- mehrere rausl�schen:
DELETE FROM Produkte
WHERE ProduktID IN(4, 5)





-- Tabelle ver�ndern mit ALTER:

-- Spalte hinzuf�gen:
ALTER TABLE Produkte
ADD Email varchar(30)


-- ohje, Fehler, Email soll nicht in die Produkte-Tabelle!


-- Spalte rausl�schen:
ALTER TABLE Produkte
DROP COLUMN Email




-- testen
SELECT *
FROM Produkte