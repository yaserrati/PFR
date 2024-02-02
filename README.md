# Data Pipeline for Alkasba Store

![Project Image]([path/to/your/image.png](https://cdn.discordapp.com/attachments/1108029638032244766/1202906716128157767/Fluxdeprojet.gif?ex=65cf292e&is=65bcb42e&hm=31f2e176b6ed7674c914c4941daa000a22a857e9beecc1c69beb6863ec8bf97a&))

## Overview

This project focuses on building a robust data pipeline for Alkasba Store, an e-commerce platform specializing in herbal and plant-based products. The pipeline extracts, processes, and analyzes data to enhance sales and uncover valuable insights for the business.

## Project Components

### 1. Workflows

#### 1st Workflow

- **Data Extraction:** Extracts data from various sources including APIs, CSV, JSON, and databases.
- **Data Transformation:** Merges data frames, removes duplicates, handles null values, and standardizes column names.
- **Loading into Data Warehouse:** Designs Fast Constellation Schema, creates data warehouse, defines tables, and establishes relationships.
- **Power BI Report:** Establishes DirectQuery connections, creates calculated columns, and develops three dashboards.
- **Business Intelligence (Decisions):** Analyzes sales and inventory data, optimizing warehousing for cost reduction.
- **Orchestration with Airflow:** Configures Airflow on Docker, defines DAG scripts, and schedules monthly DAG runs.

#### 2nd Workflow - Kafka Integration

- **Producer Kafka:** Imports necessary libraries, configures Kafka producer, defines API URL, and continuously fetches and produces data.
- **Consumer Kafka:** Imports required libraries, configures Kafka consumer, sets up Elasticsearch, processes data, defines Elasticsearch mapping, and indexes data.

### 2. Analysis with Elasticsearch and Kibana

- **Indexation in Elasticsearch:** Data stored in `index_products` for analysis.
- **Kibana Dashboard:** Comprehensive dashboard with visualizations for a thorough analysis.
- **Product Recommendation API:** Incorporates ALS machine learning model for personalized product recommendations.

## Confidentiality and Data Governance

- **GDPR Compliance:** Strict adherence to General Data Protection Regulation (GDPR) guidelines.
- **Data Governance Strategy:** Emphasizes compliance, protection against unauthorized access, regular data purging, transparency, data quality, and continuous improvement.

## Getting Started

1. Clone the repository.
2. Set up Python environment using `requirements.txt`.
3. Configure Airflow, Kafka, and other dependencies.
4. Run data pipeline workflows.

## Usage

- Detailed usage instructions can be found in the respective workflow directories.
- Refer to documentation for API endpoints and data recommendations.

## Contributing

Contributions are welcome! Please follow our [contribution guidelines](CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](LICENSE).
