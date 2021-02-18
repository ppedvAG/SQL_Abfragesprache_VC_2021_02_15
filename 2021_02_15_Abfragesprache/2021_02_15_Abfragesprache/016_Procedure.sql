-- Prozedur (procedure)


-- in einer Procedure k�nnten theoretisch auch mehrere SELECT ausgef�hrt werden
CREATE PROCEDURE Demo
AS
SELECT TOP 1 * FROM Orders ORDER BY Freight
SELECT TOP 1 * FROM Orders ORDER BY Freight DESC
GO


EXEC Demo





-- Variablen:

-- @Variablename
-- Lebenszeit: nur solange der Batch l�uft!

-- DECLARE @var1 AS int
-- SET @var1 = 100


-- Procedure mit Variablen erstellen:

CREATE PROCEDURE p_My_Customers @City varchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO

-- Variable an Procedure �bergeben:
EXEC p_My_Customers @City = 'Buenos Aires'
-- damit k�nnen wir alle Informationen aller Kunden in der gew�nschten Stadt ausgeben
-- das k�nnen wir jederzeit �ndern (beispielsweise �ber ein Eingabeformular)



-- mehrere Variablen verwenden:
CREATE PROCEDURE p_My_Customers2 @Country varchar(30), @City varchar(30)
AS
SELECT * FROM Customers WHERE Country = @Country AND City = @City
GO

EXEC p_My_Customers2 @Country = 'Germany', @City = 'Berlin'