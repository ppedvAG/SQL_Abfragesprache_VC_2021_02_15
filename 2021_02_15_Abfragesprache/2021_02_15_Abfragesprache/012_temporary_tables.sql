-- temporäre Tabellen (temporary tables)


/*

	-- lokale temporäre Tabellen
		-- existieren nur in der aktuellen Session
		#tablename


	-- globale temporäre Tabellen
		-- Zugriff auch von anderen Sessions
		##tablename
	
	-- halten nur so lange, wie Verbindung besteht

	-- können auch gelöscht werden

*/

USE Northwind

-- lokale temporäre Tabelle:
SELECT	  CustomerID
		, CompanyName
		, ContactName
		, Phone
INTO #t1
FROM Customers


SELECT *
FROM #t1


-- globale temporäre Tabelle:
SELECT	  OrderID
		, CustomerID
		, ShippedDate
INTO ##testtemp
FROM Orders



SELECT *
FROM ##testtemp

