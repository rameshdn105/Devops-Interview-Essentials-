import boto3
import datetime
from dateutil.parser import parse as parse_date
 
def lambda_handler(event,context):
    ec2_client = boto3.client('ec2')
    amis=ec2_client.describe_images(
       Filters=[
           {
               'Name': 'tag:assetId',
               'Values': ['202990']
           }
       ]
    )
    threshold_date = datetime.datetime.now(datetime.timezone.utc) - datetime.timedelta(days=1)
    print(f"Threshold date for deletion: {threshold_date}")
   #print(amis['Images'])
    for x in amis['Images']:
       #print(x['ImageId'])
        creation_date = parse_date(x['CreationDate'])
        if creation_date < threshold_date:
            image_id = x['ImageId']
            print(f"Found AMI to delete: {image_id}, created on {creation_date}")
            try:
                ec2_client.deregister_image(ImageId=image_id)
                print(f"Deregistered AMI: {image_id}")
            except Exception as e:
                print(f"Failed to deregister AMI {image_id}: {e}")
                continue
            for block_device in x.get('BlockDeviceMappings', []):
                snapshot_id = block_device.get('Ebs', {}).get('SnapshotId')
                if snapshot_id:
                    try:
                        ec2_client.delete_snapshot(SnapshotId=snapshot_id)
                        print(f"Deleted snapshot: {snapshot_id}")
                    except Exception as e:
                        print(f"Failed to delete snapshot {snapshot_id}: {e}")