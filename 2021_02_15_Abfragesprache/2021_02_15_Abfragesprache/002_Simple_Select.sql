-- SIMPLE SELECT, einfache Abfragen

-- Text, Zahlen, Rechnungen möglich


-- Zahl ausgeben
SELECT 100

-- Text ausgeben
SELECT 'Testtext'

-- Berechnung
SELECT 100*3

SELECT '100*3' -- 100*3... unter Anführungszeichen = Text!

-- mehrere Spalten
SELECT 100, 'Testtext'


-- Spaltenüberschrift vergeben
SELECT 100 AS Zahl



-- Format?
-- zwecks Übersichtlichkeit Spalten untereinander schreiben
SELECT  100, 
		'Testtext', 
		100*3


-- Empfehlung: Komma in die nächste Zeile, dann kann auskommentiert werden, ohne Fehlermeldung
SELECT	  100 AS Zahl
		, 'Testtext' AS Text
		, 100*3 AS Berechnung



		
-- Groß-/Kleinschreibung	
SELECT 100 -- STRG + SHIFT + U ..... UPPERCASE
select 100 -- STRG + SHIFT + L ..... lowercase



SELECT 100
GO

