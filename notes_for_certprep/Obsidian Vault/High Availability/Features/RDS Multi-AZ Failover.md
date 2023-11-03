#### Exam Tips:
- **Keeps a copy** of your production database in a separate AZ in case of a failure or disaster
- **Manages** the failure from one AZ to another automatically through AWS
- **MySQL, Oracle, and PostgreSQL**
	- **Use synchronous physical replication** to keep standby instance data current with the primary instance
- **SQL Server**
	- **Uses synchronous logical replication** and SQL Server's native Mirroring technology to ensure the standby is up to date
- ###### Multi-AZ Failover is DISASTER RECOVERY ONLY!
	- It is not primarily used for improving performance
	- For performance improvement, **Use read replicas**
- **Backups and restores are taken from the secondary Multi-AZ instance**
- **You can force a failover by rebooting your instance, this can be done from the console or through the RebootDBInstance API call**

#### [AWS DOCS]()

Tags:
#Note-Default