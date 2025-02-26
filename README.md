Step - 2

## Save Terraform State to an S3 Bucket
Modify Terraform to store the state file in an S3 bucket instead of locally. Ensure the bucket exists before applying Terraform.

## Fetch Latest Amazon Linux AMI Dynamically
Update the Terraform configuration to get the latest Amazon Linux AMI automatically instead of using a hardcoded AMI ID.

## Use Environment Variables in Terraform
Pass the AWS region and other configuration values as environment variables and use them in Terraform instead of hardcoding values. Apply Terraform with environment variables.
