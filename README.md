# Building an Azure Data Warehouse for Bike Share Data Analytics

Divvy is a bike sharing program in Chicago, Illinois USA that allows riders to purchase a pass at a kiosk or use a mobile application to unlock a bike at stations around the city and use the bike for a specified amount of time. The bikes can be returned to the same station or to another station. The City of Chicago makes the anonymized bike trip data publicly available for projects like this where we can analyze the data.

Since the data from Divvy are anonymous, we have created fake rider and account profiles along with fake payment data to go along with the data from Divvy. The dataset looks like this:

<img src="/img/divvy-erd.png" title="data model"  width="600">

The goal of this project is to develop a data warehouse solution using Azure Synapse Analytics:
- Design a star schema based on the business outcomes listed below;
- Import the data into Synapse;
- Transform the data into the star schema; and finally, view the reports from Analytics.

# Steps To Reproduce The project

## Task1 : Create Azure resources
1. Create an Azure PostgreSQL database
<img src="/img/postgresql.png" title=" PostgreSQL db"  width="500">
2. Create an Azure Storage Account
<img src="/img/storage_account.png" title="storage account"  width="500">
Create container:
<img src="/img/container.png" title="storage account"  width="500">
3. Create an Azure Synapse Workspace
<img src="/img/synapse_ws.png" title="synapse workspace"  width="500">
<img src="/img/resources.png" title="resources"  width="500">


## Task 2: Design a star schema

Here is the star model that I have designed to answer the business questions :
<img src="/img/star_model.png" title="star model"  width="700">


## Task 3: Create the data in PostgreSQL

Open the script file in VS Code and add the host, username, and password information for your PostgreSQL database
Run the script and verify that all four data files are copied/uploaded into PostgreSQL
<img src="/img/ingest_data.png" title="postgres"  width="700">

Verify this data exists by using pgAdmin or a similar PostgreSQL data tool.

<img src="/img/verify_data.png" title="postgres"  width="700">



## Task 4: EXTRACT the data from PostgreSQL

In Azure Synapse workspace, we will use the ingest wizard to create a one-time pipeline that ingests the data from PostgreSQL into Azure Blob Storage. This will result in all four tables being represented as text files in Blob Storage, ready for loading into the data warehouse.

<img src="/img/blob_data.png" title="storage account data"  width="700">


## Task 5: LOAD the data into external tables in the data warehouse

Once in Blob storage, the files will be shown in the data lake node in the Synapse Workspace. From here, we can use the script generating function to load the data from blob storage into external staging tables in the data warehouse we created using the Dedicated SQL Pool.

<img src="/img/create_table.png" title="create table"  width="700">

Verify the data:

<img src="/img/verify_data_after.png" title="verify table"  width="700">
## Task 6: TRANSFORM the data to the star schema

We will write SQL scripts to transform the data from the staging tables to the final star schema we designed.



1. Go to the Develop section and create a script
2. Run all scripts in folder *transformation scripts* in order to create the star tables
3. At the end of the process, you should see your star model tables created and populated in the 
<img src="/img/load_schema.png" title="star tables"  width="500">
<img src="/img/star_schema_storage.png" title="star tables"  width="500">
