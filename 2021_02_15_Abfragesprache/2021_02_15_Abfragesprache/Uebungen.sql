-- Aufwärmübungen...

-- Gib alle Produkte aus, deren ProduktID zwischen 10 und 15 (inklusive) liegt.

SELECT *
FROM Products
WHERE ProductID >= 10 AND ProductID <= 15

-- oder:

SELECT *
FROM Products
WHERE ProductID BETWEEN 10 AND 15



SELECT	  ProductID
		, ProductName
		, UnitPrice
--		, ...
FROM Products
WHERE ProductID BETWEEN 10 AND 15


-- Gib alle Produkte aus, die vom Anbieter (SupplierID) 2, 7 oder 15 geliefert werden.
SELECT *
FROM Products
WHERE SupplierID IN(2, 7, 15)

-- oder:
SELECT *
FROM Products
WHERE SupplierID = 2 OR SupplierID = 7 OR SupplierID = 15


-- Gib alle Produkte aus, deren Name mit „coffee“ endet.
SELECT *
FROM Products
WHERE ProductName LIKE '%coffee'

-- Gib alle Produkte aus, deren Name mit 'L' beginnt.
SELECT *
FROM Products
WHERE ProductName LIKE 'L%'

-- Gib alle Produkte aus, die ein 'ost' im Namen haben.
SELECT *
FROM Products
WHERE ProductName LIKE '%ost%'


-- *************************************************************************************************************
-- Gib alle Produkte aus, deren Name mit D-L beginnt und mit a, b, c, d oder m, n, o endet.

-- erster Teil:
-- beginnt mit D-L
SELECT *
FROM Products
WHERE ProductName LIKE '[D-L]%'

-- zweiter Teil:
-- endet mit a, b, c oder d
SELECT *
FROM Products
WHERE ProductName LIKE '%[a-d]'

-- dritter Teil:
-- endet mit m, n oder o
SELECT *
FROM Products
WHERE ProductName LIKE '%[m-o]'

-- zwei und drei zusammengezogen:
-- endet mit a-d oder m-o
SELECT *
FROM Products
WHERE ProductName LIKE '%[a-d | m-o]'


-- alle zusammengezogen:

SELECT *
FROM Products
WHERE ProductName LIKE '[D-L]%' AND (ProductName LIKE '%[a-d]' OR ProductName LIKE '%[m-o]')
-- bei dieser Schreibweise Achtung! Hier MÜSSEN wir eine Klammer setzen, damit es funktioniert!



-- oder kürzer:

SELECT *
FROM Products
WHERE ProductName LIKE '[D-L]%' AND ProductName LIKE '%[a-d | m-o]'


-- oder noch ein bisschen kürzer:
SELECT *
FROM Products
WHERE ProductName LIKE '[D-L]%[a-d | m-o]'



-- Übungen:
-- Gib die Lieferverzögerung der Bestellungen aus.

SELECT	  DATEDIFF(DD, RequiredDate, ShippedDate) AS Lieferverzögerung
		, RequiredDate
		, ShippedDate
FROM Orders

-- Geben Sie an, wie lange noch Zeit ist/gewesen wäre, um fristgerecht zu liefern:

SELECT	  DATEDIFF(DD, ShippedDate, RequiredDate) AS Lieferverzögerung
		, RequiredDate
		, ShippedDate
FROM Orders


-- *********************************************************************************************************
-- Aufwärmübungen:


-- Joinen von Customers- und Orders-Tabelle:
SELECT *
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- mit Alias:
SELECT *
FROM Customers AS c INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID

-- wir dürfen AS weglassen:
SELECT *
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID


--Geben Sie die Namen der Anbieter (Supplier), die Sauce verkaufen, aus. (CompanyName, ProductName, Ansprechperson, Telefonnummer). 
-- Achtung: Wie heißt das Produkt/die Produkte? Verschiedene Möglichkeiten?


SELECT	  s.CompanyName
		, p.ProductName
		, s.ContactName
		, s.Phone
FROM Products p INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.ProductName LIKE '%sauce%' OR p.ProductName LIKE N'%soße%'


-- Geben Sie alle Kunden (Firmenname) aus Brasilien und Argentinien und deren Frachtkosten aus.
-- Ordnen Sie die Ausgabe aufsteigend nach Frachtkosten.
SELECT	  c.CompanyName
		, o.Freight
FROM Customers AS c INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE Country IN('Brazil', 'Argentina')
ORDER BY Freight



-- Welche Kunden haben Chai Tee gekauft und wieviel?
-- (OrderID, CustomerID, CompanyName, ProductName, Quantity)

SELECT	 c.CompanyName
		, o.OrderID
		, o.CustomerID
		, CompanyName
		, p.ProductName
		, od.Quantity
FROM Customers AS c INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
						INNER JOIN [Order Details] AS od ON o.OrderID = od.OrderID
							INNER JOIN Products AS p ON od.ProductID = p.ProductID
WHERE ProductName LIKE '%chai%'

-- Welche Angestellten haben Chai Tee verkauft und an wen?
SELECT	  c.CompanyName
		, o.OrderID
		, o.CustomerID
		, CompanyName
		, p.ProductName
		, od.Quantity
		, o.EmployeeID
		, CONCAT(e.FirstName, ' ', e.LastName) AS [Employee Name]
FROM Customers AS c INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
						INNER JOIN [Order Details] AS od ON o.OrderID = od.OrderID
							INNER JOIN Products AS p ON od.ProductID = p.ProductID
								INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID
WHERE ProductName LIKE '%chai%'



-- Wer ist der Chef von wem?
-- Name Emp, EmpID, Name Chef, EmpId von Vorgesetzen

SELECT	  CONCAT(emp.FirstName, ' ', emp.LastName) AS EmpName
		, emp.EmployeeID AS EmpID
		, CONCAT(boss.FirstName, ' ', boss.LastName) AS BossName
		, boss.EmployeeID AS BossID
FROM Employees emp INNER JOIN Employees boss ON emp.ReportsTo = boss.EmployeeID




-- Alle Kunden, die in der gleichen Stadt wohnen, wie ein anderer Kunde (aber nicht sie selbst).
-- Customer1, City1, Customer2, City2

SELECT	  c1.CompanyName
		, c1.City
		, c2.CompanyName
		, c2.City
FROM Customers c1 INNER JOIN Customers c2 ON c1.City = c2.City
WHERE c1.CustomerID != c2.CustomerID


--Geben Sie die Mitarbeiternummer, den vollständigen Namen (in einer Spalte), die Anrede, das Geburtsdatum (ohne Zeitangabe) und die Telefonnummer aller Angestellten aus.

SELECT	  EmployeeID AS MANr
		, CONCAT(FirstName, ' ', LastName) AS MAName
		, TitleOfCourtesy AS MATitel
		, CONVERT(varchar, BirthDate, 104) AS GebDat
FROM Employees

-- oder:
SELECT	  EmployeeID
		, CONCAT(FirstName, ' ', LastName) AS EmpName
		, TitleOfCourtesy 
		, FORMAT(BirthDate, 'd', 'de-de') AS BirthDate
FROM Employees

-- oder (nicht empfohlen):
SELECT	  EmployeeID
		, CONCAT(FirstName, ' ', LastName) AS EmpName
		, TitleOfCourtesy 
		, FORMAT(BirthDate, 'dd.MM.yyyy') AS BirthDate -- ACHTUNG: MM groß schreiben, sonst Fehler! (wird als min interpretiert)
FROM Employees



-- Suchen Sie alle Bestellungen, bei denen Bier verkauft wurde. Welcher Kunde? Wieviel? Welches Bier?
-- Tipp: Der Produktname kann „Bier“ oder „Lager“ enthalten oder mit „Ale“ enden.

-- Nach Menge und Kundenname geordnet:
-- Menge absteigend (größte zuerst), 	Kundenname aufsteigend (A-Z)
SELECT	  o.OrderID
		, c.CompanyName
		, p.ProductName
		, od.Quantity		
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
					INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
						INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE ProductName LIKE '%bier%' OR ProductName LIKE '%lager%' OR ProductName LIKE '%ale'
ORDER BY od.Quantity DESC, c.CompanyName

