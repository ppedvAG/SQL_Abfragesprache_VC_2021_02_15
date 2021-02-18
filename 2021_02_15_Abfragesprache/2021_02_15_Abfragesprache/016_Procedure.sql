-- Prozedur (procedure)


-- in einer Procedure könnten theoretisch auch mehrere SELECT ausgeführt werden
CREATE PROCEDURE Demo
AS
SELECT TOP 1 * FROM Orders ORDER BY Freight
SELECT TOP 1 * FROM Orders ORDER BY Freight DESC
GO


EXEC Demo





-- Variablen:

-- @Variablename
-- Lebenszeit: nur solange der Batch läuft!

-- DECLARE @var1 AS int
-- SET @var1 = 100


-- Procedure mit Variablen erstellen:

CREATE PROCEDURE p_My_Customers @City varchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO

-- Variable an Procedure übergeben:
EXEC p_My_Customers @City = 'Buenos Aires'
-- damit können wir alle Informationen aller Kunden in der gewünschten Stadt ausgeben
-- das können wir jederzeit ändern (beispielsweise über ein Eingabeformular)



-- mehrere Variablen verwenden:
CREATE PROCEDURE p_My_Customers2 @Country varchar(30), @City varchar(30)
AS
SELECT * FROM Customers WHERE Country = @Country AND City = @City
GO

EXEC p_My_Customers2 @Country = 'Germany', @City = 'Berlin'