use PFR_Data;

-- Unit Test 1: Vérification de la transformation de l'âge
SELECT COUNT(*) as Age_inferieur_0 FROM [Dim_Customer] WHERE [Age] < 0;

-- Unit Test 2: Vérification de la transformation de la quantité
SELECT COUNT(*) as Quantity_equal_0 FROM [Fact_Sales] WHERE [Quantity] < 0;

-- Unit Test 3: Vérification du remplissage des valeurs manquantes
SELECT COUNT(*) as rating_is_null FROM [Fact_Sales] WHERE [Rating] IS NULL;

-- Unit Test 4: Vérification de la suppression des lignes avec une quantité égale à zéro
SELECT COUNT(*) as Quantity_equal_0 FROM [Fact_Sales] WHERE [Quantity] = 0;

