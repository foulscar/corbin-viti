### allows you to easily DEPLOY, SCALE, & MANAGE an application's most queries data within an in-memory cache in the cloud
- 

#### UseCases:
- Improves Latency and throughput for:
	- read-heavy application workloads
		- (Social Networking, Gaming, Media Sharing, and Q&A portals)
	- compute-intensive workload
		- (something like recommendation engine)
- Improves Application performance
	- stores critical pieces of data in-memory for fast data retrieval
	- cached information may include the results of I/O-intensive database queries or the results of computationally intensive calculations

#### Exam Tips:
- You can connect an ElastiCache with an RDS database to give faster access to frequently used data
- ###### Cache Hit: when ElastiCache has the data that is being asked for
- ###### Cache Miss: when ElastiCache has to retrieve the data from its source provider because it does not have the data that is being asked for

#### Types of ElastiCache Engines
- ###### MemcacheD
	- Multithreading
	- NO Snapshots
	- NO Replication
- ###### Redis
	- Advanced Data Structures
	- SUPPORTS Snapshots
	- SUPPORTS Replication
- ###### BOTH ARE GOOD FOR:
	- Data Partitioning
	- Sub-Millisecond Latency

#### Steps of Launching ElastiCache
1. **Select Cluster Engine and Settings**
	- You can change options between **Node Type, Number of Replicas, Multi-AZ, and Security Groups**
2. **Enable Inbound Traffic Through Security Group**
3. **Connect and Add Data**

#### Monitoring ElastiCache
- **CPU Utilization**
	- If ElastiCache exceeds the CPU utilization threshold, you can scale out by adding more nodes
- **Swap Usage**
	- If swap usage or virtual memory exceeds **50MB**, you can allocate more memory for your application
- **Evictions**
	- If non-expired items are being removed from the cache, either add additional nodes or increase the size of the nodes to accommodate the data
- **Concurrent Connection**
	- If your cache has too many connections, check your application

#### [AWS DOCS]()

Tags:
#Note-Default