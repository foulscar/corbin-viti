1. **Management Tool**:
	- Visibility and control over your AWS infrastructure
2. **Inventory of your [[EC2]] Instances**:
	- Organize and group resources together by application or environment, even including #On-Prem systems
3. **Automation**:
	- Automate common operational tasks on multiple systems simultaneously, like patching, installing applications, running scripts, etc.

#### UseCases:
- Imagine you are a SysOps Administrator supporting 100s of servers. Your manager asks you to run a command to check the network conifguration on each server.
	- You could use the [[SSM Run Command]] to **run operational tasks across multiple [[EC2]] instances**
- Imagine you are a SysOps Administrator supporting 100s of servers. Your managers asks you to update the operating system patches on all servers.
	- You could use the [[SSM Patch Manager]] to patch all servers without having to log into a single one.

#### [AWS DOCS](https://docs.aws.amazon.com/systems-manager/)

Tags:
#Note-Service
#Note-Monitoring-and-Reporting