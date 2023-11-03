Mount Targets are needed in each AZ to bring fault tolerance into your architecture using EFS

#### High Availability and Durability
- Data written to EFS is written to 3 AZs and accessible through all AZs within the region, offering **99.99%** availability

#### Elastic and Scalable
- EFS **only charges** for the capacity used and also scales to meet storage and throughput **capacity**

#### Container and Serverless File Storage and Support
- EFS integrates with **multiple** container services, Lamda, and EC2. EFS also integrates with AWS Backup for **automatic** backups

#### Offers Storage Classes and Lifecycle Management
- EFS offers **four storage classes**:
	- EFS Standard, infrequently Accessed (IA), One Zone, and One Zone IA. Life-cycle Management moves files based on **usage patterns** through life-cycle policies.

#### Bursting vs Provisioned Throughput
1. **Bursting**
	- **Scales** with the file system size
	- Uses **burst credit system** to determine bursts
2. **Provisioned**
	- **Fixed** at specified amount
	- **Increase anytime**, but only decrease throughput 24 hours after the most recent decrease

#### Encryption
1. **At Rest**
	- Data at rest can be encrypted through the AWS Console by using the integration with **Key Management Service (KMS)**
2. **In Transit**
	- Transitional data is encrypted by enabling  **Transport Layer Security (TLS)** through the EFS mount helper