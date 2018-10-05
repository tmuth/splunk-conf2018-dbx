# How to use SPL and SQL together

## Content
 - dashboards: this folder contains the dashboard with all SPL showed during the presentation
 - data-index: sample data downloaded from Splunk the 24th of August 2018. If you want newer data, check http://docs.splunk.com/Documentation/Splunk/latest/SearchTutorial/Systemrequirements#Download_the_tutorial_data_files
 - tables: SQL scripts to create the tables with their data in MySQL

## Prerequisites
This demo has been tested with:
 - Splunk 7.1.1
 - Splunk DB Connect 3.1.3
 - MySQL 5.7

## How to set up the demo
1. Install the prerequisites mentioned above
2. Execute the SQL scripts to initialize the tables
3. Add the data to Splunk located in **data/tutorialdata.zip**
4. Copy/paste the dashboard located in **dashboards** to your Splunk instance
5. Create a connection called **mysql**
6. Open the dashboard
