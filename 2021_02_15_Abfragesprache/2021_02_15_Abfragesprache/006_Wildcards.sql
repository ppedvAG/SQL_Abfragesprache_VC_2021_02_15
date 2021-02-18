-- Wildcards
-- nur beim LIKE

/*

	% ...... steht für beliebig viele unbekannte Zeichen (0 - ? )

	_ ...... steht für GENAU EIN unbekanntes Zeichen an dieser Stelle

	[a-c]...... genau 1 Zeichen aus einem definierten Wertebereich

	[^a-c]..... darf NICHT diesem Wert entsprechen

	[ a-c | x-z ] ... a-c ODER x-z

*/


USE Northwind

-- Kundennamen die mit 'Alf' beginnen
SELECT *
FROM Customers
WHERE CompanyName LIKE 'Alf%'

-- mögliche Treffer dieser Abfrage:

-- ALF
-- ALFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- ALFREDS FUTTERKISTE





-- alle Kunden, die mit A beginnen
SELECT *
FROM Customers
WHERE CompanyName LIKE 'A%'


-- alle Kunden, die mit A enden
SELECT *
FROM Customers
WHERE CompanyName LIKE '%A'


-- alle Kunden, bei denen im CompanyName irgendwo ein A vorkommt
SELECT *
FROM Customers
WHERE CompanyName LIKE '%a%'


-- im CompanyName kommt irgendwo 'kiste' vor:
SELECT *
FROM Customers
WHERE CompanyName LIKE '%kiste%'



-- Suche nach genau einem unbekannten Zeichen mit Unterstrich:

-- nur der letzte Buchstabe ist unbekannt:
SELECT *
FROM Customers
WHERE CompanyName LIKE 'Alfreds Futterkist_'

SELECT *
FROM Customers
WHERE CustomerID LIKE 'ALFK_'

-- nur die letzte Ziffer (z.B. Durchwahl) ist unbekannt:
SELECT *
FROM Customers
WHERE Phone LIKE '(5) 555-472_'




-- Wertebereiche abfragen:
-- [] sucht nach genau einem Zeichen aus einem definierten Wertebereich

-- alle, die mit a, b oder c beginnen
SELECT *
FROM Customers
WHERE CompanyName LIKE '[a-c]%'


-- alle, die mit a, c oder z beginnen
SELECT *
FROM Customers
WHERE CompanyName LIKE '[acz]%'


-- Kunde, dessen Name mit abc beginnt
-- hier suchen wir nicht nach 1 Zeichen, sondern nach mehreren, also NICHT in eckigen Klammern
SELECT *
FROM Customers
WHERE CompanyName LIKE 'abc%'


-- alle, deren CompanyName mit a beginnt und mit e endet
SELECT *
FROM Customers
WHERE CompanyName LIKE 'a%' AND CompanyName LIKE '%e'

-- oder:
SELECT *
FROM Customers
WHERE CompanyName LIKE 'a%e'





-- NOT
-- Achtung Performance: wenn möglich, positiv formulieren!


-- alle, die NICHT mit a-c beginnen:
SELECT *
FROM Customers
WHERE CompanyName LIKE '[^a-c]%'


-- oder positiv formuliert:
SELECT *
FROM Customers
WHERE CompanyName LIKE '[d-z]%'



-- alle, die mit a-c oder e-g enden
Select *
from Customers
Where CompanyName like '%[a-c]' or companyName like '%[e-g]'


-- oder andere Schreibweise:
SELECT *
FROM Customers
WHERE CompanyName LIKE '%[a-c | e-g]'

