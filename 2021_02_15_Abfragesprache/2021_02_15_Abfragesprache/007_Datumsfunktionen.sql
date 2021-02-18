-- Datumsfunktionen



/*

	Datumsintervalle:

	year, yyyy, yy = Jahr
	quarter, qq, q = Quartal
	month, MM, M = Monat
	week, ww, wk = Woche
	day, dd, d = Tag
	minute, mi, n = Minute
	second, ss, s = Sekunde
	millisecond, ms = Millisekunde
	nanosecond, ns = Nanosekunde

	weekday, dw, w = Wochentag
	dayofyear, dy, y = Tag des Jahres


*/


-- ************************************* Datum abfragen *********************************
-- auf 3-4 Millisekunden genau
SELECT GETDATE()

-- auf ~ 100 Nanosekunden genau
SELECT SYSDATETIME()


-- *********************** Datumsberechnungen: DATEADD ***********************************

SELECT DATEADD(HH, 10, '2021-02-16')
-- wenn nicht genauer angegeben, wird von 0:00 Uhr ausgegangen
-- Vorsicht mit Datumsformat!! --> Was ist Tag, was ist Monat? Systemabhängig!


-- Stunden, Minuten, Sekunden, ... können optional angegeben werden
SELECT DATEADD(HH, 10, '2021-02-16 10:50')



-- aktuelles Datum inklusive Uhrzeit (inklusive Millisekunden) mit DATEADD kombinieren
SELECT DATEADD(HH, 10, GETDATE())


-- welches Datum haben wir in 38 Tagen?
SELECT DATEADD(DD, 38, GETDATE())


-- welches Datum war vor 38 Tagen?
SELECT DATEADD(DD, -38, GETDATE())
-- negative Vorzeichen sind zulässig



-- ************************* DATUMSBERECHNUNGEN: DATEDIFF ***********************************
-- Datumsdifferenz zwischen zwei Daten

-- nächster Feiertag in D?
SELECT DATEDIFF(DD, '2021-02-16', '2021-03-08') -- 20


-- mit aktuellem Datum:
SELECT DATEDIFF(DD, GETDATE(), '2021-03-08') -- 20


-- mit Daten aus der Datenbank:
SELECT DATEDIFF(YEAR, BirthDate, GETDATE()) AS EmpAge
FROM Employees
-- Achtung bei Geburtstagen... hier wird tatsächlich nur das Jahr berücksichtigt, nicht, ob der Employee tatsächlich in diesem Jahr schon seinen Geburtstag hatte
-- um sicher zu sein, könnten wir hier die Differenz in Monaten/12 abfragen und abrunden


-- ******************** Datumsteile ausgeben: DATEPART *********************************************
-- Rückgabedatentyp: int
SELECT DATEPART(MM, '2021-02-16')

-- mit aktuellem Datum:
SELECT DATEPART(MM, GETDATE())

-- welches Quartal:
SELECT DATEPART(QQ, GETDATE())




-- gleiches Ergebnis wie mit DATEPART, andere Schreibweise:
SELECT YEAR(GETDATE())

SELECT MONTH(GETDATE())

SELECT DAY(GETDATE())


-- nur das Einstellungsjahr (ohne Tag und Monat):
SELECT YEAR(HireDate) AS YearHired
FROM Employees







-- ***************************** DATENAME ********************************
-- Datum als Text 

SELECT DATENAME(DD, GETDATE()) -- 16


-- bei DATENAME machen nur zwei Sinn: DW (Wochentag ... dayofweek) und MONTH
SELECT DATENAME(DW, GETDATE()) -- Tuesday

SELECT DATENAME(MM, GETDATE()) -- February


-- Übungen:
-- Welcher Wochentag war Ihr Geburtstag?
SELECT DATENAME(DW, '1981-04-22') -- Wednesday



-- Vor wie vielen Jahren kam der erste Star Wars Film in die Kinos? (25. Mai 1977 )
SELECT DATEDIFF(YEAR, '1977-05-25', GETDATE()) -- 44

-- wir müssen nicht das komplette Datum schreiben, es war ja nur das Jahr gefragt...
SELECT DATEDIFF(YEAR, '1977', GETDATE()) -- 44





