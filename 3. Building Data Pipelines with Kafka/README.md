# Description 
Create a streaming data pipeline by performing the following steps:

* Start a MySQL Database server
* Create a table to hold the toll data
* Start the Kafka server
* Install the Kafka python driver
* Create a topic named toll in kafka
* Download streaming data generator program
* Download and customise streaming data consumer
* Customize the consumer program to write into a MySQL database table
* Verify that streamed data is being collected in the database table

## Scenario 
I am assigned the role of data engineer at a data analytics consulting company and tasked with the following project that aims to decongest the national highways by analyzing the road traffic from different toll plazas. Each highway is operated by a different toll operator with different IT setup that use different file formats.

As a vehicle passes a toll plaza, the vehicle passes a toll plaza, the vehicle’s data like **vehicle_id**, **vehicle_type**, **toll_plaza_id** and **timestamp** are streamed to Kafka.
My dutie is to create a data pipeline that collects the streaming data and loads it into a database. 
