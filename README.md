# Data analysis  de Platform Alkasba Store de le-commerce 
 
**Rapport**

*Par : Yassine Harrati*

*Jeudi 25 Janvier 2024*

## Introduction


## Planification


## Flux de projet


## Besoin du Projet


## Cadre Technique



### 1st Workflow
    1- Extract data from different sources (API, CSV, JSON and database)
    2-Transformation
        2.1- merge data frames in one
        2.2- drop duplicates
        2.3- traiter Null value
        2.4- Columns names pour match 
        2.5- pour respecter le rgpd, j'ai crypter les donnees des users comme name, number phone, mail and adress
    3- Loading dans une data warehouse
        3.1- Conception Fast constellation schema
        3.2- Cration data warehouse
        3.3- Cration tables 
        3.4- Add relation entre les table
        3.5- Optimisation
        3.6- Les roles de database
        3.7- Unit testing
        3.8- Creation 2 Data marts
    4- Power BI Report
        4.1- Creation la connection (DirectQuery) avec les deux datamarts
        4.2- Calculated columns
        4.3- Creation 3 dashboards
            4.2.1- first one pour une petit description apropos mon rapport
            4.2.2- 2eme pour les ventes 
            4.2.3- 3eme Pour les inventories
    5- Business intelligence (decisions)
        5.1- Sales
            5.1.1- chaque dernier trimistre de chaque an kaykono sales 9lal we need ads + promotions
            5.1.2-     
        5.2- Inventory
            5.2.1- add 2 warehouse one in afrique et l'autre a l'australie
            5.2.2-
    6- Orchestration avec airflow
        6.1- Configuration airflow sur docker
        6.2- Script dags
        6.3- Run dags Une fois chaque mois


### 2nd workflow
    1-
    2-
    3-
    4-
    5-
    6-
    7-
    8-
    9-
    10-


## Producer

**1. Importation de Bibliothèques :**
**2. Configuration du Producteur Kafka :**
**3. Définition de l'URL de l'API :**
**4. Fonction de Récupération et de Production :**
**5. Boucle Principale de Récupération de Données :**

## Consumer

**1. Importation de Bibliothèques :**
**2. Configuration du Consommateur Kafka :**
**3. Configuration d'Elasticsearch :**
**4. Fonction de Traitement des Données :**
**5. Mapping d'Index Elasticsearch :**
**6. Création de l'Index :**
**7. Boucle Principale de Traitement des Messages Kafka :**

## Analyse avec Elasticsearch et Kibana
### Indexation dans Elasticsearch
### Tableau de bord Kibana

## API de Recommandation de Films
### Modèle d'Apprentissage Automatique - ALS
## Confidentialité et Gouvernance des Données
### Conformité au RGPD
### Stratégie de Gouvernance des Données


## Conclusion 

