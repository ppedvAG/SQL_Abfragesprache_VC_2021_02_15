-- UNION

-- Datentypen und Spaltenanzahl m�ssen �bereinstimmen
-- UNION macht auch ein DISTINCT

USE Northwind


SELECT 'Testtext1'
UNION
SELECT 'Testtext2'


-- mit Spalten�berschrift:
SELECT 'Testtext1' AS Test
UNION
SELECT 'Testtext2'


-- die erste Spalten�berschrift wird NICHT �berschrieben:
SELECT 'Testtext1' AS Test
UNION
SELECT 'Testtext2' AS Test2


-- mehrere Spalten m�glich:
SELECT 'Testtext1' AS Text, 100 AS Zahl
UNION
SELECT 'Testtext2', 300


-- in die selbe Spalte m�ssen gleiche (bzw. kompatible) Datentypen
-- funktioniert NICHT:
SELECT 'Testtext1' AS Text, 100 AS Zahl
UNION
SELECT 100, 'Testtext2'


-- gleiche Anzahl an Spalten notwendig!!
-- funktioniert NICHT:
SELECT 'Testtext1', 100
UNION
SELECT 'Testtext2'



-- das funktioniert: 
SELECT 'Testtext1', 100
UNION
SELECT 'Testtext2', NULL
-- SINN? Von Fall zu Fall abw�gen, ob das Sinn macht



-- Liste aller Kontaktpersonen
-- von Customers und von Suppliers
SELECT	  CustomerID AS ContactID
		, CompanyName
		, ContactName
		, Phone
FROM Customers
UNION
SELECT	  CAST(SupplierID AS nvarchar) -- Achtung: unterschiedliche Datentypen!
		, CompanyName
		, ContactName
		, Phone
FROM Suppliers


-- UNION macht auch ein DISTINCT!
-- keine Mehrfacheintr�ge
SELECT 'Testtext'
UNION
SELECT 'Testtext'



-- wenn man das nicht m�chte:
-- UNION ALL (macht KEIN DISTINCT)
SELECT 'Testtext'
UNION ALL
SELECT 'Testtext'

-- UNION ALL ist schneller als UNION, weil kein DISTINCT gemacht werden muss


-- wenn ich SICHER WEI�, dass es irgendwo keine Mehrfacheintr�ge geben kann, dann verwenden wir UNION ALL! (schneller)

-- unser Beispiel mit Kontaktpersonen ist schneller mit UNION ALL
-- hier kann es keine Mehrfacheintr�ge geben, jede CustomerID und SupplierID ist eindeutig!

SELECT	  CustomerID AS ContactID
		, CompanyName
		, ContactName
		, Phone
FROM Customers
UNION ALL
SELECT	  CAST(SupplierID AS nvarchar) -- Achtung: unterschiedliche Datentypen (CustomerID ist nchar, SupplierID int)!
		, CompanyName
		, ContactName
		, Phone
FROM Suppliers


-- �bung:
-- Geben Sie den Firmennamen, die Kontaktperson und die Telefonnummern aller Kunden und aller Supplier in einer Liste aus.
-- F�gen Sie eine Kategorie �C� f�r Customer und �S� f�r Supplier hinzu.

SELECT	  CompanyName
		, ContactName
		, Phone
		, 'C' AS Category
FROM Customers
UNION ALL
SELECT	  CompanyName
		, ContactName
		, Phone
		, 'S'
FROM Suppliers



-- Testen: Was macht UNION, UNION ALL und was ist der Unterschied zum JOIN?
-- zwei Testtabellen mit genau einer Spalte (id) erstellen:
CREATE TABLE #a (id int)

CREATE TABLE #b (id int)

-- Testdaten in diese Tabellen einf�gen:
INSERT INTO #a (id) VALUES (1), (NULL), (2), (1)

INSERT INTO #b (id) VALUES (1), (NULL), (3), (1)



-- UNION
SELECT id
FROM #a
UNION
SELECT id
FROM #b
-- NULL, 1, 2, 3
-- UNION macht auch DISTINCT!


-- UNION ALL
SELECT id
FROM #a
UNION ALL
SELECT id
FROM #b
-- 1, NULL, 2, 1, 1, NULL, 3, 1


-- INNER JOIN
SELECT *
FROM #a a INNER JOIN #b b ON a.id = b.id
-- zwei Spalten, jeweils viermal 1  (zwei �bereinstimmungen f�r den 1. Einser aus der 1. Tabelle und zwei �bereinstimmungen f�r den 2. Einser)


