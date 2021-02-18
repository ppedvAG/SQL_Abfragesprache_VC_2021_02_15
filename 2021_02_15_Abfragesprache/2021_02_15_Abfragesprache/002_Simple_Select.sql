-- SIMPLE SELECT, einfache Abfragen

-- Text, Zahlen, Rechnungen m�glich


-- Zahl ausgeben
SELECT 100

-- Text ausgeben
SELECT 'Testtext'

-- Berechnung
SELECT 100*3

SELECT '100*3' -- 100*3... unter Anf�hrungszeichen = Text!

-- mehrere Spalten
SELECT 100, 'Testtext'


-- Spalten�berschrift vergeben
SELECT 100 AS Zahl



-- Format?
-- zwecks �bersichtlichkeit Spalten untereinander schreiben
SELECT  100, 
		'Testtext', 
		100*3


-- Empfehlung: Komma in die n�chste Zeile, dann kann auskommentiert werden, ohne Fehlermeldung
SELECT	  100 AS Zahl
		, 'Testtext' AS Text
		, 100*3 AS Berechnung



		
-- Gro�-/Kleinschreibung	
SELECT 100 -- STRG + SHIFT + U ..... UPPERCASE
select 100 -- STRG + SHIFT + L ..... lowercase



SELECT 100
GO

