### Monitors all configuration changes/states of your AWS resources for compliance, with a desired state that you define
- #Configuration-Monitoring
	- Continuously monitors the configuration of your AWS resources.
- #Desired-State
	- Evaluates configurations against a desired state that you define.
- #Notifications
	- Sends events to [[EventBridge]] and [[SNS]] if a resource deviates from the desired state, e.g. a #Non-Compliant resource can trigger an [[SNS]] notification.
- #Automatic-Remediation
	- Automatically remediates #Non-Compliant resources by triggering an action that you define.

#### UseCases:
- Your company requires that [[EC2]] instances in your [[VPC]] must not have public IP addresses. AWS Config evaluates all instances and discovers taht one instance is #Non-Compliant. Config can perform an automatic remediation action that you define - e.g. stop the instance.

#### AWS Config Terminology:
1. #Rule 
	- A Config rule represents the desired configuration for a specific resource.
2. #Managed-Rules 
	- AWS provides over 180 managed rules for pre-defined common best practices (you can also create your own).
3. #Examples 
	- *s3-bucket-public-read-prohibited*
4. #Comformance-Packs 
	- A set of rules and remediation actions that can be deployed and managed as one.

#### Exam Tips:
- Change History is stored in an [[S3]] bucket
- Great for compliance and security governance
- Integrates with lots of AWS services (EXAMPLES):
	1. [[IAM]]
	2. [[EC2]]
	3. [[Elastic Block Store (EBS)]]
	4. [[Elastic Load Balancers (ELB)]]
	5. [[CloudFormation]]
	6. [[CloudFront]]
	7. [[CloudTrail]]
	8. [[KMS]]
	9. [[RDS  (Relational DataBase Service)]]
	10. [[S3]]
	11. [[Security Groups]]
	12. [[SNS]]
	13. [[VPC]]

#### [AWS DOCS](https://docs.aws.amazon.com/config/index.html)

Tags:
#Note-Service 
#Note-Monitoring-and-Reporting 