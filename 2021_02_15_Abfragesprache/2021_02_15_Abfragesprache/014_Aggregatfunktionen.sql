-- Aggregatfunktionen (aggregate functions)

-- COUNT ...... abzählen
-- AVG ........ Durchschnitt
-- SUM ........ Summe bilden
-- MIN
-- MAX

USE Northwind

SELECT *
FROM Products
-- 77 Ergebnisse --> also gibt es 77 Produkte
-- ... aber wir wollen nicht jedesmal die gesamte Tabelle ausgeben und abzählen!


-- wie viele Produkte gibt es insgesamt?
SELECT COUNT(ProductID) AS ProdCount
FROM Products

-- Durchschnitt aller Frachtkosten
SELECT AVG(Freight)
FROM Orders
-- 78,2442

-- niedrigster Stückpreis?
SELECT MIN(UnitPrice)
FROM Products
-- 2,50

-- höchsten Stückpreis?
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



-- Durchschnittlicher Stückpreis pro Lieferant (Supplier)
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
-- genauso viele wie oben - die Anzahl der Städte ändert sich nicht!


-- wie viele Kunden gibt es pro Land?
SELECT    COUNT(CustomerID) AS [Anzahl Kunden]
        , Country
FROM Customers
GROUP BY Country




-- Liste von allen Ländern?
SELECT DISTINCT Country
FROM Customers


-- wie viele Länder? 
SELECT COUNT(Country)
FROM Customers
-- 91
-- FALSCH! So viele, wie Kunden, weil jeder Kunde in einem Land ansässig ist

-- so:
SELECT COUNT(DISTINCT Country)
FROM Customers
-- mit DISTINCT! Dann bekommen wir die Anzahl an Ländern (keine Doppelten)

-- ABER: Wenn wir etwas Eindeutiges zählen, brauchen wir kein DISTINCT (also z.B. bei IDs)
-- ohne DISTINCT: schneller; daher lassen wir DISTINCT weg, wenn es nicht notwendig ist (also nicht überall sicherheitshalber ein Distinct reinschreiben, sondern vorher überlegen, ob man es dort braucht).


-- ACHTUNG:
SELECT COUNT(Region)
FROM Customers
-- 31
-- 31 Einträge bei Region, NICHT Anzahl der unterschiedlichen Regionen
-- hier könnten wir irrtümlich glauben, dass das schon das richtige Ergebnis ist, denn es sind ja weniger, als Kunden - tatsächlich gibt es einfach viele Kunden, bei denen keine Region eingetragen ist

-- wenn wir wissen wollen, wie viele unterschiedliche Regionen es gibt, brauchen wir wieder ein DISTINCT
SELECT COUNT(DISTINCT Region)
FROM Customers
-- 18


-- Rechnungssumme?
-- innerhalb von SUM können wir auch noch Berechnungen anstellen:
SELECT	  OrderID
		, SUM(UnitPrice*Quantity) AS Rechnungssumme 
FROM [Order Details]
GROUP BY OrderID
-- (stimmt genaugenommen noch nicht ganz, wir müssten auch Discount und Frachtkosten abziehen; für Frachtkosten bräuchten wir noch ein JOIN mit Orders)
