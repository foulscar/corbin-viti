### Amazon's proprietary MySQL- and PostgreSQL-compatible relational database
- Provides the speed, performance, and scale of popular commercial databases with the simplicity of the more common open source databases
- Provides a fault-tolerant and self-healing storage system which lowers the risk of data loss

#### UseCases:
- 

#### Aurora Scaling
- **Aurora DB Cluster Volume**
	- Aurora uses cluster volumes to virtually distribute the DB storage across multiple Availability Zones
- **Storage Auto Scaling**
	- MySQL- and PostgreSQL-compatible database engines are customized to take advantage of fast distributed storage, which grows as needed up to 128TiB
- **Self-Repairing Storage**
	- Since Aurora keeps data copies in multiple Availability Zones, data blocks and disks are continuously scanned for errors and repaired automatically
- **Cache Warming**
	- Aurora pre-populates its buffer pool with the pages for common queries that are stored in an in-memory page cache, while provisioning other instance

#### Aurora Serverless
- Is an auto-scaling version of Aurora which automatically scales capacity up and dwon to meet the needs of your application
- Supports existing Aurora features, including Multi-AZ deployments, read replicas, Global Database, and more
- Ideal for architectures and applications which have infrequent and unpredictable workloads, ye still require high availability

#### Exam Tips:
- **Is Aurora at 100% CPU Utilization?**
	1. If WRITES are causing the issue, scale up (increase instance size)
	2. If READS are causing the issue, scale out (make more read replicas)
- Aurora comes in **2 flavors**
	1. Aurora
	2. Aurora Serverless
- Redundancy
	- 2 copies of your data are contained in 3 seperate Availability Zones, with a total of 6 copies
- Storage is Self-Healing
	- Data blocks and disks are continuously scanned for errors and automatically repaired

#### [AWS DOCS]()

Tags:
#Note-Default