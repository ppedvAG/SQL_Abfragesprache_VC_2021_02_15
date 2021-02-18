-- VIEWS (Sichten)


-- Syntax
-- CREATE VIEW vName
-- AS
-- SELECT
-- FROM



USE Northwind

-- wir brauchen oft die Kundenkontakte, also können wir die Abfrage in einer VIEW hinterlegen
-- die Daten sind immer aktuell, da beim Verwenden der VIEW die dahinterliegende Abfrage ausgeführt wird
CREATE VIEW v_CustomerContacts
AS 
SELECT	  CustomerID
		, CompanyName
		, ContactName
		, ContactTitle
		, Phone
FROM Customers

-- haben wir eine VIEW erstellt, können wir damit arbeiten, wie mit einer Tabelle:
SELECT *
FROM v_CustomerContacts


SELECT	CompanyName, Phone
FROM v_CustomerContacts


SELECT CompanyName
FROM v_CustomerContacts
WHERE CompanyName LIKE '[a-c]%'



-- Annahme: wir sind nur für die deutschen Kunden zuständig
-- also erstellen wir eine VIEW, die nur die Kunden aus D ausgibt
CREATE VIEW v_CustomersGermany
AS
SELECT	  c.CustomerID
		, o.OrderID
		, c.CompanyName
		, o.RequiredDate
		, o.ShippedDate
		, o.OrderDate
		, c.Address
		, c.City
		, c.Country
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE Country = 'Germany'


SELECT *
FROM v_CustomersGermany