### Task Description
The goal of this task is to make the Terraform configuration more dynamic and adaptable. Instead of hardcoding values, the user will define the AWS region at the time of applying Terraform. Terraform will then automatically retrieve the latest Amazon Linux AMI and build the required infrastructure, ensuring the deployment is always up to date with the most recent instance image. Additionally, the Terraform state will be stored in an S3 bucket instead of locally, allowing for better state management and collaboration.
At the end of this task, the user will be able to run:

```
terraform apply -var="region=us-west-2"
```

- Save Terraform State to an S3 Bucket
Modify Terraform to store the state file in an S3 bucket instead of locally. Ensure the bucket exists before applying Terraform.

- Fetch Latest Amazon Linux AMI Dynamically
Update the Terraform configuration to get the latest Amazon Linux AMI automatically instead of using a hardcoded AMI ID.

- Use Environment Variables in Terraform
Pass the AWS region and other configuration values as environment variables and use them in Terraform instead of hardcoding values. Apply Terraform with environment variables.

**This step takes you one step forward in improving the way we work on our deployment and CI processes.**

