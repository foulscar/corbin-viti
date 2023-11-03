### A monitoring service to monitor the #health-and-performance of your AWS Resources, as well as the applications you run on AWS, and in your own data center
- [[CloudWatch Agent]]: define your own [[Custom Metrics]] on an instance or #On-Prem server.
- [[CloudWatch Logs]]: allows you to monitor operating system and application logs.
- All [[EC2]] instances send key health and performance metrics to CloudWatch
	- **Default [[EC2]] host-level metrics** consist of: CPU, network, disk, and status check.
- Metrics are stored **indefinitely**
- You can retrieve data from any [[EC2]] or [[Elastic Load Balancers (ELB)]] instance, **even after it has been terminated**.

#### What can CloudWatch Monitor?
- #Compute 
	- [[EC2]] Instances
	- [[Auto Scaling Group]]
	- [[Elastic Load Balancers (ELB)]]
	- [[Route 53]] Health Checks
	- [[Lambda]]
- #Storage-and-Content-Delivery
	- [[Elastic Block Store (EBS)]] Volumes
	- [[Storage Gateway]]
	- [[CloudFront]]
- #Databases-and-Analytics
	- [[DynamoDB]] Tables
	- [[ElastiCache]] Nodes
	- [[RDS  (Relational DataBase Service)]] Instances
	- [[Redshift]]
	- [[EMR]] (Elastic Map Reduce)
- #Other
	- [[SNS]] Topics
	- [[SQS (Simple Queue Service)]] Queues
	- [[API Gateway]]
	- [[Estimated AWS Charges]]

#### Exam Tips:
- By default [[EC2]] sends metric data to CloudWatch in **5-minute inervals**.
	- For an **additional charge**, you can enable [[detailed monitoring]] that sends metrics at **1-minute intervals**.
- For [[Custom Metrics]], the default is **1-minute intervals**, and you can configure [[high-resolution metrics]] that are sent at **1-second intervals**.

#### [AWS DOCS](https://docs.aws.amazon.com/cloudwatch/index.html)

Tags:
#Note-Service
#Note-Monitoring-and-Reporting