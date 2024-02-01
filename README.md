# Project Overview

## Project Needs:

This project addresses the need for efficient data processing, transformation, and visualization, focusing on business intelligence and data governance.

## Technical Framework:

### 1st Workflow:

1. **Data Extraction:**
   - Extract data from various sources, including APIs, CSV, JSON, and databases.

2. **Data Transformation:**
   - Merge data frames.
   - Remove duplicates.
   - Handle null values.
   - Standardize column names.
   - GDPR Compliance: Encrypt sensitive user data (name, phone number, email, address).

3. **Loading into Data Warehouse:**
   - Design Fast Constellation Schema.
   - Create data warehouse.
   - Define tables and establish relationships.
   - Optimize performance.
   - Implement database roles.
   - Conduct unit testing.
   - Create 2 Data Marts.

4. **Power BI Report:**
   - Establish DirectQuery connections with the two data marts.
   - Create calculated columns.
   - Develop 3 dashboards:
     - Overview dashboard.
     - Sales dashboard.
     - Inventories dashboard.

5. **Business Intelligence (Decisions):**
   - Analyze sales data.
     - Subsection 5.1.1.
     - Subsection 5.1.2.
   - Analyze inventory data.
     - Subsection 5.2.1.
     - Subsection 5.2.2.

6. **Orchestration with Airflow:**
   - Configure Airflow on Docker.
   - Define DAG scripts.
   - Schedule monthly DAG runs.

### 2nd Workflow:

## Producer Module:

1. **Library Importation:**
2. **Kafka Producer Configuration:**
3. **API URL Definition:**
4. **Data Retrieval and Production Function:**
5. **Main Data Retrieval Loop:**

## Consumer Module:

1. **Library Importation:**
2. **Kafka Consumer Configuration:**
3. **Elasticsearch Configuration:**
4. **Data Processing Function:**
5. **Elasticsearch Index Mapping:**
6. **Index Creation:**
7. **Main Kafka Message Processing Loop:**

## Analysis with Elasticsearch and Kibana:

- Indexing data into Elasticsearch.
- Creating Kibana dashboards.

## Movie Recommendation API:

### Machine Learning Model - ALS

## Data Privacy and Governance:

- GDPR Compliance.
- Data governance strategy.

## Conclusion:

In conclusion, this project encompasses comprehensive data workflows, from extraction to visualization, ensuring GDPR compliance and data governance. The implemented systems provide valuable business intelligence for informed decision-making.
