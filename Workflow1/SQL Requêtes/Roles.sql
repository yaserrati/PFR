USE PFR_Data;



-- Cr�er le r�le pour l'�quipe de d�veloppement
CREATE ROLE Developers;

-- Accorder des permissions sur les tables
GRANT SELECT, INSERT, UPDATE, DELETE ON Dim_Customer TO Developers;
GRANT SELECT, INSERT, UPDATE, DELETE ON Dim_Date TO Developers;
GRANT SELECT, INSERT, UPDATE, DELETE ON Dim_Product TO Developers;
GRANT SELECT, INSERT, UPDATE, DELETE ON Dim_Shipping TO Developers;
GRANT SELECT, INSERT, UPDATE, DELETE ON Dim_Supplier TO Developers;
GRANT SELECT, INSERT, UPDATE, DELETE ON Dim_Warehouse TO Developers;
GRANT SELECT, INSERT, UPDATE, DELETE ON Fact_Inventory TO Developers;
GRANT SELECT, INSERT, UPDATE, DELETE ON Fact_Sales TO Developers;



-- Cr�er le r�le pour l'�quipe BI
CREATE ROLE BI_Team;

-- Accorder des permissions de lecture sur les tables
GRANT SELECT ON Dim_Customer TO BI_Team;
GRANT SELECT ON Dim_Date TO BI_Team;
GRANT SELECT ON Dim_Product TO BI_Team;
GRANT SELECT ON Dim_Shipping TO BI_Team;
GRANT SELECT ON Dim_Supplier TO BI_Team;
GRANT SELECT ON Dim_Warehouse TO BI_Team;
GRANT SELECT ON Fact_Inventory TO BI_Team;
GRANT SELECT ON Fact_Sales TO BI_Team;




-- Cr�er le r�le pour les clients
CREATE ROLE Clients;

-- Accorder des permissions sur les tables sp�cifiques aux clients
GRANT SELECT ON Dim_Customer TO Clients;
GRANT SELECT ON Fact_Sales TO Clients;


