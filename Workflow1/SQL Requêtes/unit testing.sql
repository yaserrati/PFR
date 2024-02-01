use PFR_Data;

-- Unit Test 1: V�rification de la transformation de l'�ge
SELECT COUNT(*) as Age_inferieur_0 FROM [Dim_Customer] WHERE [Age] < 0;

-- Unit Test 2: V�rification de la transformation de la quantit�
SELECT COUNT(*) as Quantity_equal_0 FROM [Fact_Sales] WHERE [Quantity] < 0;

-- Unit Test 3: V�rification du remplissage des valeurs manquantes
SELECT COUNT(*) as rating_is_null FROM [Fact_Sales] WHERE [Rating] IS NULL;

-- Unit Test 4: V�rification de la suppression des lignes avec une quantit� �gale � z�ro
SELECT COUNT(*) as Quantity_equal_0 FROM [Fact_Sales] WHERE [Quantity] = 0;

