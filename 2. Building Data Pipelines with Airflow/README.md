## Description 
* Explore the anatomy of of a DAG, create a DAG and submit it 
![AirflowImage](airflowImage.png)

* The key advantages of Apache Airflow’s approach to representing data pipelines as DAGs is that they are expressed as code, which makes your data pipelines more maintainable, testable, and collaborative

* Create a DAG that runs daily, and extracts user info from **/etc/passwd** file, transform it, and loads it into a file 
* This DAG has two tasks **extract** that extracts fields from /etc/passwd file and **transform_and_load** that transforms and loads data into a file 
