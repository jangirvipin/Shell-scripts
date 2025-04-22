#!/bin/bash

# Variables (change these accordingly)
AMI_ID="ami-0c55b159cbfafe1f0"  # Example: Amazon Linux 2 AMI in us-east-1
INSTANCE_TYPE="t2.micro"
KEY_NAME="my-key"               # Replace with your actual key name
SECURITY_GROUP="sg-0123456789abcdef0"  # Replace with your actual security group ID
TAG_NAME="MyEC2Instance"

# Launch EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id $AMI_ID \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$TAG_NAME}]" \
  --query 'Instances[0].InstanceId' \
  --output text)

echo "Instance created with ID: $INSTANCE_ID"
