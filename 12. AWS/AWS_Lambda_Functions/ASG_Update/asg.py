import json
import boto3

def lambda_handler(event, context):
    asg_client = boto3.client('autoscaling')

    for x in event:
        asg_client.update_auto_scaling_group(
            AutoScalingGroupName=x['Name'],
            MinSize=x['min_size'],
            MaxSize=x['max_size'],
            DesiredCapacity=x['desired_capacity']  # Include desired capacity update
        )

    return {
        'statusCode': 200,
        'body': json.dumps('Auto Scaling Groups updated successfully!')
    }
