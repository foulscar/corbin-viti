## Moving data to different regions to create a higher level of availability within or application

### Best Uses:
- #### Compliance Objectives
	- Perfect for applications that have compliance standards requiring the data to be geographically spaced out
- ### Increase Efficiency
	- For architectures with cross-regional compute, replicating data would assist with application efficiency
- ### Improving Latency
	- Enabling cross-region replication improves application latency by moving data closer to the consumer

### Configuration Steps
1. Create S3 Buckets in Separate Regions
2. Turn on Versioning
	- Versioning must be enabled for Cross-Region Replication to work
3. Create Replication Rule
	- Create a Replication Rule by selecting the source and destination buckets. Also, select the role you would like to use or create for the replication

## Exam Tips:
- Cross-Region Replication in S3 is a great way to introduce High Availability within an architecture
- Understand Best Uses