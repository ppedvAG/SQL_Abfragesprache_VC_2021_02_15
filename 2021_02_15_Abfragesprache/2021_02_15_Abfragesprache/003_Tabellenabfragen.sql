-- einfache Tabellenabfragen
-- SELECT auf Tabellen

-- IMMER überprüfen, welche DB verwendet wird!

USE Northwind
GO



-- Syntax:
-- SELECT Spalte1, Spalte2, Spalte3, 'Text', Funktion(), Zahl
-- FROM Tabelle




SELECT *
FROM Customers

-- * sollte NICHT verwendet werden. Auch, wenn die gesamte Tabelle ausgegeben werden soll, sollten stattdessen die Spaltennamen angegeben werden.



SELECT	CompanyName
FROM Customers



-- mehrere Spalten auswählen:
SELECT	  CompanyName
		, CustomerID
		, ContactName
FROM Customers


-- mit ALIAS
SELECT	  CompanyName AS Firmenname
		, CustomerID AS KundenID
		, ContactName AS Kontaktperson
		, Phone AS Telefonnummer
FROM Customers



SELECT	  ProductID AS ProduktID
		, ProductName AS Produktname
		, UnitPrice AS Stückpreis
FROM Products


-- Database Diagram erstellen/nachschlagen hilfreich!
-- Databases -> Northwind -> Database Diagrams -> Rechtsklick -> New Database Diagram

SELECT	  OrderID
		, CustomerID
		, EmployeeID
		, ShipCountry
FROM Orders

