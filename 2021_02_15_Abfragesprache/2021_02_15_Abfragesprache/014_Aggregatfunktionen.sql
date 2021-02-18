-- Aggregatfunktionen (aggregate functions)

-- COUNT ...... abz�hlen
-- AVG ........ Durchschnitt
-- SUM ........ Summe bilden
-- MIN
-- MAX

USE Northwind

SELECT *
FROM Products
-- 77 Ergebnisse --> also gibt es 77 Produkte
-- ... aber wir wollen nicht jedesmal die gesamte Tabelle ausgeben und abz�hlen!


-- wie viele Produkte gibt es insgesamt?
SELECT COUNT(ProductID) AS ProdCount
FROM Products

-- Durchschnitt aller Frachtkosten
SELECT AVG(Freight)
FROM Orders
-- 78,2442

-- niedrigster St�ckpreis?
SELECT MIN(UnitPrice)
FROM Products
-- 2,50

-- h�chsten St�ckpreis?
SELECT MAX(UnitPrice)
FROM Products
-- 263,50


-- Summe aller Frachtkosten
SELECT SUM(Freight)
FROM Orders
-- 64942,69



SELECT    SUM(Freight) AS SumFreight
		, CustomerID
FROM Orders
GROUP BY CustomerID -- PRO (Frachtkosten PRO Kunde)



-- das ist sinnlos:
SELECT    SUM(Freight) AS SumFreight
		, CustomerID
		, ShipCountry
		, OrderID
FROM Orders
GROUP BY CustomerID, ShipCountry, OrderID
-- damit bekommen wir die Summe der Frachtkosten pro Bestellung... und das sind wieder genau die Frachtkosten selbst!



-- Summe der Frachtkosten pro Kunde
SELECT    SUM(Freight) AS SumFreight
		, CustomerID
FROM Orders
GROUP BY CustomerID -- gruppieren nach folgender Spalte (PRO...)
ORDER BY CustomerID -- anordnen nach folgender Spalte (Ausgabereihenfolge - alphabetisch geordnet nach...)






/*
	Reihenfolge, in der SELECT-Statements geschrieben werden:

	SELECT
	FROM
	WHERE
	GROUP BY
	ORDER BY


*/



-- Durchschnittlicher St�ckpreis pro Lieferant (Supplier)
SELECT    AVG(UnitPrice) AS AvgPrice
		, SupplierID
FROM Products
GROUP BY SupplierID



-- wie viele Kunden gibt es pro Stadt?
SELECT    COUNT(CustomerID) AS [Anzahl Kunden]
        , City
FROM Customers
GROUP BY City


-- wie viele Kunden gibt es pro Stadt im jeweiligen Land?
SELECT    COUNT(CustomerID) AS [Anzahl Kunden]
        , Country
		, City
FROM Customers
GROUP BY Country, City
-- genauso viele wie oben - die Anzahl der St�dte �ndert sich nicht!


-- wie viele Kunden gibt es pro Land?
SELECT    COUNT(CustomerID) AS [Anzahl Kunden]
        , Country
FROM Customers
GROUP BY Country




-- Liste von allen L�ndern?
SELECT DISTINCT Country
FROM Customers


-- wie viele L�nder? 
SELECT COUNT(Country)
FROM Customers
-- 91
-- FALSCH! So viele, wie Kunden, weil jeder Kunde in einem Land ans�ssig ist

-- so:
SELECT COUNT(DISTINCT Country)
FROM Customers
-- mit DISTINCT! Dann bekommen wir die Anzahl an L�ndern (keine Doppelten)

-- ABER: Wenn wir etwas Eindeutiges z�hlen, brauchen wir kein DISTINCT (also z.B. bei IDs)
-- ohne DISTINCT: schneller; daher lassen wir DISTINCT weg, wenn es nicht notwendig ist (also nicht �berall sicherheitshalber ein Distinct reinschreiben, sondern vorher �berlegen, ob man es dort braucht).


-- ACHTUNG:
SELECT COUNT(Region)
FROM Customers
-- 31
-- 31 Eintr�ge bei Region, NICHT Anzahl der unterschiedlichen Regionen
-- hier k�nnten wir irrt�mlich glauben, dass das schon das richtige Ergebnis ist, denn es sind ja weniger, als Kunden - tats�chlich gibt es einfach viele Kunden, bei denen keine Region eingetragen ist

-- wenn wir wissen wollen, wie viele unterschiedliche Regionen es gibt, brauchen wir wieder ein DISTINCT
SELECT COUNT(DISTINCT Region)
FROM Customers
-- 18


-- Rechnungssumme?
-- innerhalb von SUM k�nnen wir auch noch Berechnungen anstellen:
SELECT	  OrderID
		, SUM(UnitPrice*Quantity) AS Rechnungssumme 
FROM [Order Details]
GROUP BY OrderID
-- (stimmt genaugenommen noch nicht ganz, wir m�ssten auch Discount und Frachtkosten abziehen; f�r Frachtkosten br�uchten wir noch ein JOIN mit Orders)
