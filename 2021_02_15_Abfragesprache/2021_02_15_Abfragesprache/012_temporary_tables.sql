-- tempor�re Tabellen (temporary tables)


/*

	-- lokale tempor�re Tabellen
		-- existieren nur in der aktuellen Session
		#tablename


	-- globale tempor�re Tabellen
		-- Zugriff auch von anderen Sessions
		##tablename
	
	-- halten nur so lange, wie Verbindung besteht

	-- k�nnen auch gel�scht werden

*/

USE Northwind

-- lokale tempor�re Tabelle:
SELECT	  CustomerID
		, CompanyName
		, ContactName
		, Phone
INTO #t1
FROM Customers


SELECT *
FROM #t1


-- globale tempor�re Tabelle:
SELECT	  OrderID
		, CustomerID
		, ShippedDate
INTO ##testtemp
FROM Orders



SELECT *
FROM ##testtemp

