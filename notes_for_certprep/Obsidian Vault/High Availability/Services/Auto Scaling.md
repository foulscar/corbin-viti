### Allows you to configure plans to automatically scale your resources
- Allows you to configure and manage scaling for your resources through a scaling plan
- Uses dynamic and predictive scaling to scale your resources
- Useful for scaling applications across several AWS services

#### Scaling Plans:
- A set of directions for scaling your resources
- Contains a **Scaling Strategy**

#### Scaling Strategy:
- Instructs AWS Auto Scaling on how to optimize resources in your scaling plan for availability, cost, or both

#### Types of Scaling:
1. **Dynamic Scaling:**
	- Automatically adjusts in response to resource utilization through target tracking
2. **Predictive Scaling:**
	- Scales load by analyzing resources' historical load
	- Uses machine learning

#### Creating Scaling Plans:
1. **[[CloudFormation]] Scripting:
	- Find scalable resources through existing [[CloudFormation]] templates
2. **[[EC2]] Auto Scaling Groups:
	- Select one or more existing [[EC2]] Auto Scaling Groups to be included in your scaling plans
3. **Tagged Resources:**
	- Search for scalable resources using the tags applied to them

#### Scalable AWS Services:
1. **[[EC2]]:**
	- Maintain an [[Auto Scaling Group]] through launching or terminating instances
2. **[[DynamoDB]]:**
	- Enable tables or secondary indexes to increase or decrease read and write capacity
3. **[[Elastic Container Service (ECS)]]:**
	- Adjust [[Elastic Container Service (ECS)]] services and tasks in response to load variations
4. **[[Aurora]]:**
	- Automatically adjust the number of read replicas in the [[Aurora]] DB cluster

#### Exam Tips:
- Understand scaling plans
- Differentiate Dynamic Scaling VS Predictive Scaling
- Understand how to create and maintain AWS Auto Scaling Plans
- ###### Troubleshoot EC2 Auto Scaling groups through the EC2 console
- ###### Monitor Auto Scaling plans through AWS Auto Scaling
- 

#### Common Issues:
- Auto Scaling Group **Not Found**
- Auto Scaling Service **Not Enabled In Your Account**
- Auto Scaling Config **Not Working Correctly**
- ##### Compute/Storage
	- Invalid EBS device mapping
	- Instance type not compatible in AZ
	- Attempting to attach an EBS block device to an instance-store AMI
	- AZ no longer supported
- ##### Security
	- Associated key pair doesn't exist
	- Security group doesn't exist

#### [AWS DOCS](https://docs.aws.amazon.com/autoscaling/)

Tags:
#Note-Service 
#Note-High-Availability