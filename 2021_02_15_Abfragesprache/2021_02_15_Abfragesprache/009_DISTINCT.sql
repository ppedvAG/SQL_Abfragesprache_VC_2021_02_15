-- DISTINCT



-- wie bekommen wir eine Liste von allen L�ndern, in die wir liefern?


-- erste Idee:
SELECT Country
FROM Customers
-- nein, das wars nicht...
-- so viele Eintr�ge, wie Kunden insgesamt


-- so:
SELECT DISTINCT Country
FROM Customers
-- 21 Eintr�ge (keine Doppelten)


-- bringt nix, weil wieder so viele, wie Kunden:
SELECT DISTINCT Country, CustomerID
FROM Customers
-- DISTINCT gilt f�r das gesamte SELECT
-- bei CustomerID k�nnen aber keine Mehrfacheintr�ge weggek�rzt werden, weil die ID eindeutig ist



SELECT DISTINCT Country, City
FROM Customers
-- 69 (so viele, wie St�dte)





-- Liste von allen L�ndern, in denen wir Angestellte haben?
SELECT DISTINCT Country
FROM Employees
-- USA, UK



