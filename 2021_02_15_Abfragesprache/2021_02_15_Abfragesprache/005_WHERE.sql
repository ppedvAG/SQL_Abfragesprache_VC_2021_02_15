-- WHERE clause, WHERE-Klausel, WHERE (Bedingungen)
-- nur die Ergebnisse, wo eine bestimmte Bedingung erf�llt wird, sollen ausgegeben werden


/*
	WHERE Operatoren

	=, <, >, <=, >=

	!=, <>  .......................... darf NICHT einem bestimmten Wert entsprechen


	AND, OR

	LIKE, IN, BETWEEN


	-- wenn m�glich, positiv formulieren
	-- schneller, als mit "NOT"

		NOT IN, NOT LIKE, NOT BETWEEN (nicht so gut f�r Performance)

	IS NULL, IS NOT NULL

*/


-- alles aus der Customers-Tabelle
SELECT *
FROM Customers


-- bestimmte Spalten aus der Customers-Tabelle
SELECT	  CustomerID
		, CompanyName
		, ContactName
FROM Customers



-- alle Kunden aus Deutschland
SELECT	  CustomerID
		, CompanyName
		, ContactName
--		, Country
FROM Customers
WHERE Country = 'Germany'



-- alle Kunden aus Deutschland in Berlin
SELECT	  CustomerID
		, CompanyName
		, ContactName
FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'


-- A OR B bedeutet: entweder A oder B oder auch beide d�rfen erf�llt sein
-- A
-- B
-- A, B


-- alle Kunden aus Deutschland, �sterreich und der Schweiz
SELECT *
FROM Customers
WHERE Country = 'Germany' OR Country = 'Austria' OR Country = 'Switzerland'
-- OR!! Der Kunde wohnt ENTWEDER in D, A oder CH


-- oder mit IN:
SELECT *
FROM Customers
WHERE Country IN('Germany', 'Austria', 'Switzerland')




-- NOT:
SELECT *
FROM Orders
WHERE Freight != 148.33
-- alle Bestellungen, die NICHT diesen Frachtkostenwert haben


-- alle Bestellungen, deren Frachtkosten h�her als 100 sind
SELECT *
FROM Orders
WHERE Freight > 100


-- alle Bestellungen, deren Frachtkosten niedriger als 200 sind
SELECT *
FROM Orders
WHERE Freight < 200


-- alle Bestellungen, deren Frachtkosten zwischen 100 und 200 (inkl.) liegen
SELECT *
FROM Orders
WHERE Freight >= 100 AND Freight <= 200


-- oder mit BETWEEN:
SELECT *
FROM Orders
WHERE Freight BETWEEN 100 AND 200 -- inkl. 100 und 200! BETWEEN macht auch ein <= und >=


-- �bungen:
-- Geben Sie alle Kunden aus, die in Buenos Aires in Argentinien ans�ssig sind.
SELECT *
FROM Customers
WHERE Country = 'Argentina' AND City = 'Buenos Aires'


-- Geben Sie alle portugiesischen und spanischen Kunden aus.
SELECT *
FROM Customers
WHERE Country = 'Portugal' OR Country = 'Spain'

-- oder mit IN:
SELECT *
FROM Customers
WHERE Country IN('Portugal', 'Spain')


-- Geben Sie alle Produkte aus, von denen mehr als 100 vorhanden sind.
SELECT *
FROM Products
WHERE UnitsInStock > 100


-- Geben Sie die Nettofrachtkosten, Bruttofrachtkosten und die Mehrwertsteuer aus (Berechnung).
-- Annahme: Frachtkosten in der DB sind netto
SELECT 	  Freight AS Netto
		, Freight * 1.19 AS Brutto
		, Freight * 0.19 AS MwSt
FROM Orders



