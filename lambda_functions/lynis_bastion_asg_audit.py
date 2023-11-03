import boto3

def lambda_handler(event, context):
    # Create an Auto Scaling client
    autoscaling = boto3.client('autoscaling')
    
    # List instances in the Auto Scaling Group
    response = autoscaling.describe_auto_scaling_groups(AutoScalingGroupNames=['prod-bastion-asg'])
    instance_ids = [instance['InstanceId'] for group in response['AutoScalingGroups'] for instance in group['Instances']]
    
    # Create an SSM client
    ssm = boto3.client('ssm')
    
    # Run the SSM Automation document on the instances
    ssm_command = {
        'DocumentName': 'lynis_bastion_runbook',
        'InstanceIds': instance_ids
    }
    
    # Add the TargetParameterName to control the rate of execution
    target_parameter_name = 'Targets'
    
    # Modify the 'Targets' parameter with the correct format
    targets = [{'Key': 'InstanceIds', 'Values': instance_ids}]
    
    response = ssm.start_automation_execution(
        DocumentName='lynis_bastion_runbook',
        TargetParameterName='list_of_instances',
        Targets=[
            {
                'Key': "InstanceIds",
                'Values': ["i-0f0bc54f56f091eff"]
            }
        ]
    )
    
    return {
        'statusCode': 200,
        'body': targets
    }