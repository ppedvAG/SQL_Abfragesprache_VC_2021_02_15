-- häufig verwendete Serverfunktionen


-- ********************************** TRIM, LEN, DATALENGTH **********************************************


SELECT 'Test'


SELECT LEN('Test') -- 4

SELECT DATALENGTH('Test') -- 4


SELECT LEN('Test     ') -- 4 -- zählt Leerzeichen nicht mit!


-- ein Eintrag wurde eventuell mit Leerzeichen aufgefüllt oder enthält versehentlich Leerzeichen...




-- Achtung mit Datalength: bei Unicode doppelt so viel wie Zeichen (Speicherplatz)
SELECT DATALENGTH('Test     ') -- 9 (zählt Leerzeichen mit)


-- TRIM, LTRIM, RTRIM entfernt unerwünschte Leerzeichen vor und nach dem Text
-- Wegschneiden von Leerzeichen am Ende
SELECT RTRIM('Test     ') -- RTRIM = right trim, entfernt Leerzeichen rechts

-- schneidet Leerzeichen am Anfang weg
SELECT LTRIM('     Test') -- LTRIM = left trim, entfernt Leerzeichen links

-- schneidet Leerzeichen am Anfang und Ende weg
SELECT TRIM('     Test     ')

-- Leerzeichen in der Mitte bleiben erhalten
SELECT TRIM('     Test Test     ')

-- überprüfen:
SELECT LEN(TRIM('     Test Test     ')) -- 9
SELECT DATALENGTH(TRIM('     Test Test     ')) -- 9







-- DATALENGTH: vorsicht bei Datentyp nchar, nvarchar! Doppelt so viel! (Wegen Unicode.)

USE Northwind
SELECT DATALENGTH(CustomerID) FROM Customers WHERE CustomerID = 'ALFKI' -- 10! Weil Datentyp nchar(5)
SELECT LEN(CustomerID) FROM Customers WHERE CustomerID = 'ALFKI' -- 5
SELECT DATALENGTH(CompanyName) FROM Customers WHERE CustomerID = 'ALFKI' -- 38! Weil Datentyp nchar
SELECT LEN(CompanyName), CompanyName FROM Customers WHERE CustomerID = 'ALFKI' -- 19
-- hat nichts mit Leerzeichen zu tun:
SELECT DATALENGTH(TRIM(CompanyName)) FROM Customers WHERE CustomerID = 'ALFKI' -- trotzdem noch 38
SELECT LEN(TRIM(CompanyName)), CompanyName FROM Customers WHERE CustomerID = 'ALFKI' -- 19; Leerzeichen in der Mitte bleibt erhalten



SELECT LEN(CustomerID)
FROM Customers
-- 5: wieviele Zeichen stehen tatsächlich drin?


SELECT DATALENGTH(CompanyName)
FROM Customers
-- unterschiedlich lange Einträge: jeweils der Speicherplatz, der verbraucht wurde


SELECT LEN(CompanyName)
FROM Customers
-- die tatsächliche Anzahl an Zeichen in dem Eintrag





-- *****************************************  REVERSE  **************************************************
-- Text in umgekehrter Reihenfolge anzeigen
SELECT REVERSE('REITTIER')

-- hmmm....

SELECT REVERSE('Trug Tim eine so helle Hose nie mit Gurt?')


SELECT REVERSE('123456789')



-- ****************************** AUSSCHNEIDEN: LEFT, RIGHT, SUBSTRING *****************************************

-- schneidet die ersten vier Zeichen aus (Test)
SELECT LEFT('Testtext', 4) -- Test

--schneidet die letzten vier Zeichen aus (text)
SELECT RIGHT('Testtext', 4) -- text

-- Textausschnitt erstellen mit Substring
SELECT SUBSTRING('Testtext', 4, 2) -- tt
-- ab welcher Stelle (4) wollen wir wie viele (2) Zeichen ausschneiden


SELECT LEFT(REVERSE('123456789'), 3) -- 987
-- damit wieder in ursprünglicher Reihenfolge: nochmals reverse:
SELECT REVERSE(LEFT(REVERSE('123456789'), 3))



-- ******************************* CONCAT - Strings zusammenfügen ***************************************


SELECT CONCAT('abc', 'def', 'ghi', 'jkl')


SELECT CONCAT('Ich weiß, ', 'dass ich', ' ',  'nichts weiß.') AS Zitat



SELECT CONCAT('James', ' ', 'Bond') AS FullName


SELECT CONCAT(FirstName, ' ', LastName) AS EmpName
FROM Employees



-- ************************************ Groß-/Kleinbuchstaben *****************************
-- alles in Großbuchstaben ausgeben:
SELECT UPPER(LastName)
FROM Employees
-- UPPERCASE


-- alles in Kleinbuchstaben ausgeben:
SELECT LOWER(LastName)
FROM Employees
-- lowercase




-- Übung:

--Angenommen, durch einen Fehler gibt es Leerzeichen in einem String:
--'    Test    '
--.a) Entferne die Leerzeichen
--.b) Gib die Länge des Strings vorher und nachher in einer Tabelle aus:

-- a)
SELECT DATALENGTH('     Test     ') AS Vorher


-- b)
SELECT	  DATALENGTH('     Test     ') AS Vorher
		, DATALENGTH(TRIM('     Test     ')) AS Nachher




		
-- ***************************** REPLICATE - ZEICHEN MEHRFACH AUSGEBEN  ***********************************

SELECT REPLICATE('?', 5) -- ?????

SELECT REPLICATE('abc', 3) -- abcabcabc



-- an welcher Stelle befindet sich ein bestimmtes Zeichen: CHARINDEX
-- CHARINDEX gibt die erste Stelle aus, an der sich das gesuchte Zeichen (Zeichenfolge) befindet


SELECT CHARINDEX('a', 'Leo') -- 0 -- Null heißt: dieses Zeichen kommt hier nicht vor

SELECT CHARINDEX('e', 'Leo') -- 2 -- e kommt zum ersten Mal an Stelle 2 vor

SELECT CHARINDEX('schnecke', 'Zuckerschnecke')


SELECT CHARINDEX('e', 'Zuckerschnecke')


SELECT	  CHARINDEX(' ', ContactName) AS Leerzeichen
		, ContactName
FROM Customers


-- an welcher Stelle befindet sich das LETZTE Leerzeichen in 'Wolfgang Amadeus Mozart'?
SELECT CHARINDEX(' ', 'Wolfgang Amadeus Mozart')



-- langsam:

-- wie viele Zeichen sind es insgesamt?
SELECT LEN('Wolfgang Amadeus Mozart') -- 23


SELECT REVERSE('Wolfgang Amadeus Mozart') -- trazoM suedamA gnagfloW


SELECT CHARINDEX(' ', 'trazoM suedamA gnagfloW') -- 7


-- 23 - 7 = 16 

-- 23 - 7 + 1 = richtige Stelle


SELECT LEN('Wolfgang Amadeus Mozart') - CHARINDEX(' ', REVERSE('Wolfgang Amadeus Mozart')) + 1 -- 17


SELECT LEN('Georg Friedrich Händel') - CHARINDEX(' ', REVERSE('Georg Friedrich Händel')) + 1 -- 16


-- mit Info aus DB
-- hier bringt es nicht viel, weil der ContactName nur 1 Leerzeichen enthält (also letztes Leerzeichen = erstes Leerzeichen)
--SELECT LEN(ContactName) - CHARINDEX(' ', REVERSE(ContactName)) + 1
--FROM Customers

SELECT CHARINDEX(' ', ContactName)
FROM Customers


-- Zeichen ersetzen: REPLACE

SELECT REPLACE('Hallo!', 'a', 'e') -- Hello!


SELECT REPLACE(REPLACE('Hallo!', 'a', 'e'), '!', '?') -- Hello?


SELECT REPLACE(REPLACE(REPLACE('Hallo!', 'a', 'e'), '!', '?'), 'h', 'B')


SELECT REPLACE('Zuckerschnecke', 'e', '?') -- Zuck?rschn?ck? -- ersetzt alle 'e' mit '?'



-- ******************************************** STUFF *******************************************************
-- Text einfügen ("reinstopfen") mit STUFF

-- 1: wo soll eingefügt werden
-- 2: bei welcher Stelle beginnend
-- 3: wie viele Zeichen sollen weggelöscht werden
-- 4: was soll eingefügt werden

SELECT STUFF('Testtext', 5, 0, '_') -- Test_text


SELECT STUFF('Testtext', 4, 2, '??') -- Tes??ext



--Die letzten drei Stellen einer Telefonnummer sollen durch xxx ersetzt werden:
--z.B.:  +49 86779889xxx

--Bonus: die Lösung soll unabhängig von der Länge der Telefonnummer funktionieren


-- Möglichkeit 1:
SELECT STUFF('1234567890', LEN('1234567890')-2, 3, 'xxx')
-- funktioniert unabhängig von der Länge!


-- Möglichkeit 2:
SELECT LEFT('1234567890', 7) + 'xxx'

SELECT CONCAT(LEFT('1234567890', 7), 'xxx')
-- Achtung, funktioniert nur mit fixer Länge!

-- Möglichkeit 3:
SELECT CONCAT(LEFT('1234567890', LEN('1234567890')-3), 'xxx')
-- wie Möglichkeit 2, funktioniert aber für variable Länge


-- Möglichkeit 4:
SELECT REVERSE(STUFF(REVERSE('1234567890'), 1, 3, 'xxx'))
-- funktioniert auch bei variabler Länge!


SELECT REVERSE(STUFF(REVERSE(Phone), 1, 3, 'xxx')) AS SecretNumber
	--, Phone
FROM Customers




-- Von der Telefonnummer aus der Customers-Tabelle sollen nur die letzten 3 Zeichen angezeigt werden; alle anderen sollen mit x ersetzt werden. (xxxxxxxxxxxxxxx789)

SELECT STUFF ('12345678901234567890', 1, (LEN('12345678901234567890')-3), 
				REPLICATE ('X',(LEN('12345678901234567890')-3)))


SELECT STUFF (Phone, 1, (LEN(Phone)-3), REPLICATE ('x',(LEN(Phone)-3))) AS SecretPhone
FROM Customers











