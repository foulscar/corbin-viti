### Records user activity in your AWS account
- Enabled by default when you create your AWS account
- Records and logs all API calls made to AWS
- Records events related to creation, modification, or deletion of resources

#### UseCases:
- #Incident-Investigation
	- After-the-fact investigation of incidents in your AWS account
- #Security-Analysis
	- **Near real-time** security analysis of user activity
		- ### It can take up to 15 minutes for the API call to appear in CloudTrail & logs published to [[S3]] are published around every 5 minutes
- #Compliance 
	- Can be used to help you meet industry, regulatory compliance, and audit requirements.

#### Exam Tips:
- **ALMOST all AWS services are supported**
- Logs are made in JSON of **WHO?, WHEN?, WHAT AND WHERE?, SOURCE IP, REQUEST PARAMETERS, and the AWS RESPONSE**
- Logs are made using [[CloudTrail Logs]] (A CloudTrail Feature)
- **By default, logs are stored for 90 days**
- You can create a [[CloudTrail Trail]] to indefinitely store logs in an [[S3]] bucket
- Secure By Default
	- **Encrypted** using Server Side Encryption
	- Log **integrity validation** means logs are digitally signed, so you can detect if a log was changed or deleted
- By default, a trail created in the console will apply to **all regions**

#### [AWS DOCS](https://docs.aws.amazon.com/cloudtrail/index.html)

Tags:
#Note-Service 
#Note-Monitoring-and-Reporting 