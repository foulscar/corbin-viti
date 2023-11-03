#### Recovery Point Objective (RPO)
- How many backups/data do we need to capture for a given point (how frequent do we do backups)
- How much data can my application afford to lose?

#### Recovery Time Objective (RTO)
- How long would it take to get back on track after a disaster
- How long can I afford for my application to be down?

## Disaster Recovery Strategies
#### RPO/RTO:
- Backup & Restore **Cost+**
	- Hours
- Pilot Light  **Cost++**
	- 10s of minutes
- Warm Standby **Cost+++**
	- Minutes
- Multi-Site active/active **Cost++++**
	- Real-Time