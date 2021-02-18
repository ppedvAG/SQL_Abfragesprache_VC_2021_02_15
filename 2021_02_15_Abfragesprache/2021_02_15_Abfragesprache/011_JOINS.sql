-- JOINS
-- Informationen aus mehr als einer Tabelle holen


-- INNER JOIN
		
-- OUTER JOIN (LEFT JOIN oder RIGHT JOIN)
				
USE Northwind


-- INNER JOIN

SELECT *
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID


-- Spalten angeben:
SELECT	  OrderID
		, Orders.CustomerID -- bei nicht eindeutigen Namen MUSS dabeistehen, aus welcher Tabelle
		, CompanyName
		, ShippedDate
--		, ...
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID


-- bei den anderen SOLLTE trotzdem dabeistehen, aus welcher Tabelle:
SELECT	  Orders.OrderID
		, Orders.CustomerID
		, Customers.CompanyName
		, Orders.ShippedDate
--		, ...
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID


-- etwas kürzere Schreibweise (mit Tabellen-Alias):
SELECT	  o.OrderID
		, o.CustomerID
		, c.CompanyName
		, o.ShippedDate
--		, ...
FROM Customers AS c INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID

-- noch ein bisschen kürzer (das AS darf weggelassen werden):
SELECT	  o.OrderID
		, o.CustomerID
		, c.CompanyName
		, o.ShippedDate
--		, ...
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID


-- mit WHERE einschränken:
SELECT	  o.OrderID
		, o.CustomerID
		, c.CompanyName
		, o.ShippedDate
--		, ...
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE Country = 'Germany'


-- mit ORDER BY:
SELECT	  o.OrderID
		, o.CustomerID
		, c.CompanyName
		, o.ShippedDate
--		, ...
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE Country = 'Germany'
ORDER BY ShippedDate




-- welche Kunden haben noch nichts bestellt?
-- erste Idee:
SELECT	  o.OrderID
		, o.CustomerID
		, c.CompanyName
		, o.ShippedDate
--		, ...
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE OrderID IS NULL
-- funktioniert NICHT!! Hier werden nur die aufgeführt, die schon etwas bestellt haben!! (INNER JOIN)



-- Idee 2:
-- RIGHT JOIN
SELECT	  o.OrderID
		, o.CustomerID
		, c.CompanyName
		, o.ShippedDate
--		, ...
FROM Customers c RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
-- in DIESEM Fall gleiches Ergebnis (bringt nix)
-- hier haben wir alle Informationen aus der Orders-Tabelle + die Übereinstimmungen aus der Customers-Tabelle abgefragt; in der Orders-Tabelle stehen aber nur die Kunden drin, die schon etwas bestellt haben


-- Idee 3:
-- LEFT JOIN
-- mit LEFT JOIN funktioniert es: Wir bekommen alle Informationen aus der Customers-Tabelle (also auch die Kunden, die noch nichts bestellt haben und somit nicht in der Orders-Tabelle aufscheinen).
-- Jetzt können wir sagen, wir wollen die Kunden, die noch keine OrderID haben = die, die noch nichts bestellt haben
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.ShippedDate
--		, ...
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE OrderID IS NULL
ORDER BY o.CustomerID



-- mehr als eine Tabelle miteinander verknüpfen:

SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.ShippedDate
		, od.Quantity
		, od.ProductID
		, p.ProductName
--		, ....
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID 
					INNER JOIN [Order Details] od ON o.OrderID = od.OrderID 
						INNER JOIN Products p ON od.ProductID = p.ProductID




