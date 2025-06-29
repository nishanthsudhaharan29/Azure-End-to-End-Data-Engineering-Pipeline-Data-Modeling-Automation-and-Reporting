## Azure End-to-End Data Engineering Pipeline: Data Modeling, Automation, and Reporting

## Project Description

This project implements a modern Azure-based data engineering and analytics pipeline to extract, process, and visualize music store sales data from the Chinook SQL database. The solution leverages Azure services and Power BI to deliver actionable business insights regarding revenue, track sales, artist performance, and genre popularity across countries.

### Key Features
- End-to-end ETL pipeline using Azure-native services
- Clean, structured medallion architecture (Bronze, Silver, Gold)
- Dynamic Power BI dashboard with metrics like revenue, top artists, track sales, and preferred media types
- Secure and scalable infrastructure with automated daily refreshes
- Data model and relationships designed in Power BI

---

## Value to Business

This solution provides data-driven insights into digital music sales, helping stakeholders:
- Understand revenue breakdowns by artist, genre, and playlist
- Identify top-performing regions and customer behaviors
- Make informed business and marketing decisions
- Reduce manual reporting via automation

By structuring the data transformation in layers and standardizing formats, the data becomes highly usable and trustworthy, enabling real-time analysis through Power BI.

---

## Solution Architecture

1. **Data Ingestion**  
   - Chinook SQL scripts were executed to create and populate the database in an on-premises SQL Server instance.
   - Azure Data Factory (ADF) pipelines extract raw data into Azure Data Lake Storage (ADLS) - Bronze Layer.

2. **Data Transformation**  
   - Azure Databricks is used to clean, standardize, and enrich the data.
   - Transformed data is written to the Silver and Gold layers in ADLS.

3. **Data Loading & Reporting**  
   - Gold layer data is loaded into Azure Synapse Analytics for fast querying.
   - Power BI is connected to Synapse to build dynamic dashboards.
   - A custom data model and relationships were built in Power BI using the Chinook schema.

4. **Automation & Monitoring**  
   - ADF triggers execute pipelines daily.
   - Pipeline status and performance metrics are monitored using ADF and Synapse.

5. **Security & Governance**  
   - Azure Key Vault stores sensitive credentials securely.
   - Role-Based Access Control (RBAC) is enforced using Azure Entra ID.

---

## Power BI Dashboard Overview

The Power BI dashboard offers interactive views including:
- Total revenue and track sales
- Top artists by revenue
- Genre and media type preferences
- Playlist performance by quantity and revenue
- Regional breakdown of orders
- Year-over-year total order trends

The data model for the dashboard was created manually in Power BI and follows the Chinook database schema, ensuring relational integrity.

![Dashboard Preview](./images/chinook_dashboard.png)

![Data Model](./images/chinook_datamodel.png)

---

## Technology Stack

- **SQL Server (On-Premises):** Source database (Chinook)
- **Azure Data Factory (ADF):** Data pipeline orchestration
- **Azure Data Lake Storage (ADLS):** Hierarchical data storage
- **Azure Databricks:** Data cleaning and transformation
- **Azure Synapse Analytics:** Data warehousing and analytics layer
- **Power BI:** Dashboarding and reporting
- **Azure Key Vault:** Secrets and credential management
- **Azure Entra ID:** Identity and access management

---

## Setup Instructions

### Prerequisites
- Azure Subscription with adequate credits
- Access to a local machine with SQL Server and SQL Server Management Studio (SSMS)

### Step 1: Azure Environment Setup
1. Create a new Azure Resource Group
2. Provision the following services:
   - Azure Data Factory
   - Azure Data Lake Storage (Bronze, Silver, Gold containers)
   - Azure Databricks Workspace
   - Azure Synapse Analytics Workspace
   - Azure Key Vault

### Step 2: Database Setup
- Execute the Chinook SQL scripts to create and populate the database in SQL Server.

### Step 3: Data Ingestion
- Create linked services and self-hosted integration runtime in ADF
- Build pipelines to copy data from SQL Server to ADLS (Bronze layer)

### Step 4: Data Transformation
- Mount ADLS to Azure Databricks using service principal credentials stored in Key Vault
- Create Databricks notebooks to:
  - Bronze ➝ Silver: Clean and standardize raw data
  - Silver ➝ Gold: Aggregate and model business-ready data

### Step 5: Data Loading & Reporting
- Load Gold layer data into Synapse SQL Pools
- Connect Power BI to Synapse
- Design reports and visuals using the Chinook schema and data model

### Step 6: Automation & Monitoring
- Configure daily triggers in ADF for pipeline execution
- Use Monitoring dashboards in ADF and Synapse to track performance

### Step 7: Security & Governance
- Use Azure Key Vault to store connection strings and secrets
- Apply RBAC policies via Azure Entra ID to restrict access

### Step 8: End-to-End Testing
- Insert test records in SQL Server
- Manually trigger ADF pipeline or wait for the scheduled run
- Verify updates flow from Bronze to Gold
- Confirm updates are reflected in Power BI

---

## Conclusion

This project demonstrates a scalable, secure, and automated data pipeline that converts raw sales data from the Chinook database into meaningful insights through Power BI. By leveraging the Azure ecosystem, it ensures real-time, role-based access to high-quality analytics for business stakeholders.
