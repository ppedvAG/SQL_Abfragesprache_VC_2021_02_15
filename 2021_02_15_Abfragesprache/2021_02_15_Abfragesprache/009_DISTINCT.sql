-- DISTINCT



-- wie bekommen wir eine Liste von allen Ländern, in die wir liefern?


-- erste Idee:
SELECT Country
FROM Customers
-- nein, das wars nicht...
-- so viele Einträge, wie Kunden insgesamt


-- so:
SELECT DISTINCT Country
FROM Customers
-- 21 Einträge (keine Doppelten)


-- bringt nix, weil wieder so viele, wie Kunden:
SELECT DISTINCT Country, CustomerID
FROM Customers
-- DISTINCT gilt für das gesamte SELECT
-- bei CustomerID können aber keine Mehrfacheinträge weggekürzt werden, weil die ID eindeutig ist



SELECT DISTINCT Country, City
FROM Customers
-- 69 (so viele, wie Städte)





-- Liste von allen Ländern, in denen wir Angestellte haben?
SELECT DISTINCT Country
FROM Employees
-- USA, UK



