-- TOP
-- unbedingt ORDER BY verwenden!!!





-- nur die erste Zeile ausgeben:

SELECT TOP 1 *
FROM Customers


-- was genau ist die erste Zeile???
SELECT TOP 1 *
FROM Customers
WHERE Country = 'Brazil'

-- um sicherzustellen, dass wirklich die Ergebnisse in der ersten Zeile auftauchen, die wir dort erwarten, M�SSEN wir ein ORDER BY verwenden!

-- ORDER BY!!!
-- standardm��ig wird aufsteigend geordnet
SELECT *
FROM Customers
ORDER BY CustomerID -- ASC -- ascending (aufsteigend, vom kleinsten zum gr��ten Wert geordnet) (Default)

-- wollen wir absteigend ordnen: DESC angeben
SELECT *
FROM Customers
ORDER BY CustomerID DESC -- descending (absteigend, vom gr��ten zum kleinsten Wert geordnet)




-- TOP und ORDER BY
-- abh�ngig davon, wonach wir geordnet haben, steht etwas anderes in der ersten Zeile!
SELECT TOP 1 *
FROM Customers
ORDER BY CustomerID
-- ALFKI


SELECT TOP 1 *
FROM Customers
ORDER BY Country
-- CACTU


SELECT TOP 1 *
FROM Customers
ORDER BY Phone -- macht nicht viel Sinn; nur um zu zeigen, ORDER BY bestimmt, WAS in der ersten Zeile steht
-- MAISD 



-- wir k�nnen so viele Zeilen ausgeben, wie wir wollen
-- die ersten 3, 10, 50, 1000... frei w�hlbar

-- die ersten 10 Zeilen:
SELECT TOP 10 *
FROM Customers
ORDER BY Country




-- Spalten ausw�hlen:
SELECT TOP 10	  CustomerID
				, CompanyName
				, ContactName
FROM Customers
ORDER BY Country


-- mit Prozent:
SELECT TOP 10 PERCENT *
FROM Customers
ORDER BY CustomerID
-- 91 Kunden... 10 Zeilen??
-- rundet auf den n�chsten ganzzahligen Wert auf

-- mit Spaltennamen
SELECT TOP 10 PERCENT CustomerID
					, CompanyName
					, ContactName
FROM Customers
ORDER BY CustomerID


-- die letzten 3 Kunden (alphabetisch... wenns einen mit Z gibt, soll der zuerst ausgegeben werden)
SELECT TOP 3 CustomerID
			, CompanyName
			, ContactName
FROM Customers
ORDER BY CustomerID DESC
-- WOLZA, WILMK, WHITC  (es gibt keinen mit Z)



SELECT TOP 13 *
FROM Orders
ORDER BY Freight
-- genau 13

SELECT TOP 13 WITH TIES *
FROM Orders
ORDER BY Freight
-- 14; alle, die den gleichen Wert haben, wie der letzte in der Liste, werden auch noch mit ausgegeben


-- �bungen:
-- Geben Sie das teuerste Produkt aus.
SELECT TOP 1 *
FROM Products
ORDER BY UnitPrice DESC
-- 263,50


-- testen:
SELECT UnitPrice
FROM Products
ORDER BY UnitPrice



-- Suchen Sie die Top 10% der Produkte mit den gr��ten Verkaufsmengen (ProductID, Quantity).
-- Einschlie�lich Produkte mit der gleichen Einkaufsmenge wie das letzte in der urspr�nglichen Ausgabe.

SELECT TOP 10 PERCENT WITH TIES ProductID, Quantity
FROM [Order Details]
ORDER BY Quantity DESC



-- Geben Sie die drei Mitarbeiter, die als erste eingestellt wurden, aus (die schon am l�ngsten beim Unternehmen sind).
-- W�hlen Sie nicht alle, sondern nur einige in diesem Zusammenhang sinnvolle Spalten aus.
SELECT TOP 3  EmployeeID
			, LastName
			, FirstName
			, HireDate
FROM Employees
ORDER BY HireDate -- ASC (kleinste Jahreszahl = am l�ngsten beim Unternehmen)






-- ORDER BY:

SELECT *
FROM Customers
ORDER BY Country ASC, CustomerID DESC


SELECT TOP 1 *
FROM Customers
ORDER BY Country
-- CACTU


SELECT TOP 1 *
FROM Customers
ORDER BY Country ASC, CustomerID DESC
-- RANCH







