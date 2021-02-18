-- CAST, CONVERT, FORMAT
-- in welchem Format soll etwas dargestellt werden


-- Datentypen, von denen wir schon einmal gehört haben sollten:
/*
	

	-- String Datentypen

		char ... fixe Anzahl an Zeichen
		nchar ... fixe Anzahl an Zeichen in Unicode

		varchar(n) ....... variable Anzahl an Zeichen
		nvarchar(n)....... variable Anzahl an Zeichen in Unicode


	-- numerische Datentypen

		bit .............. 1, 0

		int .............. ganzzahliger Datentyp
			tinyint, smallint, int, bigint

		float ............ Nachkommastellen

		decimal(10, 2) .... insgesamt 10 Stellen, davon 2 Nachkommastellen (kann frei definiert werden)

		money ............. auf 4 Nachkommastellen genau


	-- Datumsdatentypen
		
		datetime ......... auf ~ 3-4 ms genau

		datetime2 ........ auf ~ 100 ns genau

		date

		time


	-- boolean.... true/false/NULL


*/

-- funktioniert:
SELECT '123' + 3 -- 126


-- funktioniert NICHT:
SELECT '123.5' + 3
-- Conversion failed when converting the varchar value '123.5' to data type int.


-- mit expliziter Konvertierung möglich:
SELECT CAST('123.5' AS float) + 3 -- 126,5

/*
	implizite und explizite Konvertierung in der Microsoft-Dokumentation:
	https://docs.microsoft.com/de-de/sql/t-sql/data-types/data-type-conversion-database-engine?view=sql-server-ver15


*/

-- ******************************************** CAST ************************************************************
-- umwandeln von Datentypen

-- Syntax:
-- SELECT CAST(expression AS data_type)
-- 1: was soll konvertiert werden
-- 2: in welchen Datentyp


-- funktioniert, aber nur mit CAST alleine haben wir keinen Einfluss auf das Ausgabeformat!
SELECT CAST(GETDATE() AS varchar) -- Feb 16 2021 12:11PM



-- mit Information aus DB:
SELECT CAST(BirthDate AS varchar)
FROM Employees
-- kein Einfluss auf Ausgabeformat!


-- NICHT gut:
SELECT CAST('2021-02-16' AS date)
-- Vorsicht: was ist Tag, was Monat? Systemabhängig!


-- wir verwenden CAST also nur zum Umwandeln von einem Datentyp in einen anderen
-- für Datum nicht sonderlich nützlich




-- ***************************************** CONVERT *******************************************************
-- wie der Name schon sagt, konvertiert CONVERT einen Datentyp in einen anderen
-- für Datum haben wir aber mit dem Style-Parameter die Möglichkeit, es in ein sinnvolles Format zu bringen

-- Syntax:
-- SELECT CONVERT(data_type[(length)], expression[, style])
-- 1: in welchen Datentyp soll konvertiert werden
-- 2: was soll konvertiert werden
-- 3: welches Datumsformat

SELECT CONVERT(varchar(10), 12345.5)

-- funktioniert auch mit Datum:
SELECT CONVERT(varchar, GETDATE()) -- Feb 16 2021 12:15PM --> systemabhängig



-- Achtung mit Anzahl Zeichen!!!
SELECT CONVERT(varchar(3), SYSDATETIME())
-- macht keinen Sinn!



-- Style Parameter:

SELECT CONVERT(varchar, GETDATE(), 104)

/*
	Style-Parameter in der Microsoft-Dokumentation:
	https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017#date-and-time-styles


*/

-- mit dem Style-Parameter können wir Datum im gewünschten Format ausgeben:

SELECT    CONVERT(varchar, GETDATE(), 104) AS DE
		, CONVERT(varchar, GETDATE(), 101) AS US
		, CONVERT(varchar, GETDATE(), 103) AS GB



-- nur die letzten beiden Stellen der Jahreszahl (nicht empfohlen):
SELECT    CONVERT(varchar, GETDATE(), 4) AS DE
		, CONVERT(varchar, GETDATE(), 1) AS US
		, CONVERT(varchar, GETDATE(), 3) AS GB





-- ****************************************** FORMAT **************************************
-- Ausgabedatentyp nvarchar

SELECT FORMAT(1234567890, '###-###-##-##') -- 123-456-78-90
-- Achtung mit Anzahl Zeichen!



-- mit Datum:

SELECT FORMAT(GETDATE(), 'dd.MM.yyyy') -- Ausnahmefall!! ACHTUNG!! MM groß schreiben!!! (sonst wird es fälschlicherweise als Minute interpretiert!)


-- mit Überschrift 
SELECT FORMAT(GETDATE(), 'dd.MM.yyyy') AS Datum



-- funktioniert NICHT!!
SELECT FORMAT('2021-02-16', 'dd.MM.yyyy')
-- Argument data type varchar is invalid for argument 1 of format function.
-- FORMAT macht keine Konvertierung


-- ********************************* CULTURE-PARAMETER **************************************
-- Aber bei FORMAT haben wir die Möglichkeit, Datum mit dem Culture-Parameter in die gewünschte Form zu bringen:

SELECT FORMAT(SYSDATETIME(), 'd', 'de-de')




/*
	welche Culture-Parameter gibt es:
	Microsoft-Dokumentation:
	https://docs.microsoft.com/de-de/bingmaps/rest-services/common-parameters-and-types/supported-culture-codes

*/

-- Datum in Zahlen:
SELECT	  FORMAT(SYSDATETIME(), 'd', 'de-de') AS DE
		, FORMAT(SYSDATETIME(), 'd', 'en-us') AS US
		, FORMAT(SYSDATETIME(), 'd', 'en-gb') AS GB
		, FORMAT(SYSDATETIME(), 'd', 'sv') AS Schweden


-- Datum ausgeschrieben:
SELECT	  FORMAT(SYSDATETIME(), 'D', 'de-de') AS DE
		, FORMAT(SYSDATETIME(), 'D', 'en-us') AS US
		, FORMAT(SYSDATETIME(), 'D', 'en-gb') AS GB 
		, FORMAT(SYSDATETIME(), 'D', 'sv') AS Schweden



-- Beachte: Januar (de-de), Jänner (de-at)  ;)
SELECT	  FORMAT(HireDate, 'D', 'de-de') AS DE
		, FORMAT(HireDate, 'D', 'de-at') AS AT
		, FORMAT(HireDate, 'D', 'en-us') AS US
		, FORMAT(HireDate, 'D', 'en-gb') AS GB 
		, FORMAT(HireDate, 'D', 'sv') AS Schweden
FROM Employees





-- Wann endet die Pause:
SELECT DATEADD(MI, 60, GETDATE()) -- 2021-02-16 13:45:56.500





