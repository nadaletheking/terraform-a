# Terraform AWS EC2 Setup with Nginx

## Overview
This is a learning task to use Terraform for setting up an AWS EC2 instance in the Tel Aviv region, installing Nginx, and assigning an Elastic IP. The goal is to verify that the Nginx server is accessible via the assigned IP address.

## Task Requirements

1. **Search how to install and use Terraform** on your machine.
2. **Install AWS CLI for Windows** and set up the necessary credentials.
3. **Ensure AWS CLI is working** by listing S3 buckets or other basic commands.

## Terraform Task

All tasks below must be completed using Terraform only:

1. **Create an EC2 Instance**
   - Deploy an EC2 instance in the **Tel Aviv region**.
   - Choose an appropriate instance type (e.g., `t2.micro`).

2. **Install Nginx on the EC2 Instance**
   - Configure the instance with ssh to install and enable Nginx.

3. **Attach an Elastic IP**
   - Assign a static public IP to the EC2 instance.


## Execution
- Write a Terraform script that automates all the above steps.
- Apply the script to deploy the resources.
- Check that Nginx is accessible via the public IP.

## Cleanup
- Use Terraform to destroy all created resources after completion.

## Notes
- Everything must be done via Terraform scripts.
- No manual CLI commands outside Terraform.
- Modify and experiment with Terraform configurations as needed.

Good luck with your learning task! 🚀

