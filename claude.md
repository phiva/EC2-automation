# Claude.md - EC2 Automation Project Guide

## Project Overview
This repository automates AWS EC2 instance provisioning using Terraform with GitHub Actions CI/CD pipeline integration.

## Repository Structure

### Terraform Configuration Files
- **main.tf** - Defines the AWS EC2 instance resource with configurable AMI, instance type, and subnet
- **provider.tf** - AWS provider configuration set to us-east-1 region
- **variables.tf** - Input variables for AMI ID, instance type, and subnet ID with defaults

### CI/CD Workflow
- **.github/workflows/ec2-automation.yaml** - GitHub Actions workflow that automatically applies Terraform changes on push to main branch

## Key Components

### Workflow Pipeline (ec2-automation.yaml)
1. **Trigger**: Automatically runs on push to main branch
2. **Environment**: Runs on ubuntu-latest
3. **AWS Credentials**: Uses GitHub secrets for AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
4. **Steps**:
   - Checkout code
   - Setup Terraform 1.6.0
   - Run terraform init
   - Run terraform plan
   - Run terraform apply -auto-approve

### EC2 Instance Configuration (main.tf)
- Creates an AWS EC2 instance
- Uses variables for flexibility (ami_id, instance_type, subnet_id)
- Tags instance as "GH-Terraform-EC2"
- Default: Amazon Linux 2 (ami-0f9de6e2d2f067fca) with t2.micro instance type

### Variables (variables.tf)
- `ami_id`: AMI image ID (defaults to Amazon Linux 2)
- `instance_type`: EC2 instance type (defaults to t2.micro)
- `subnet_id`: Subnet ID for instance placement (required)

## How to Use

### Prerequisites
1. AWS account with appropriate permissions
2. GitHub secrets configured:
   - AWS_ACCESS_KEY_ID
   - AWS_SECRET_ACCESS_KEY
3. Valid subnet_id for your AWS region (us-east-1)

### Deployment
- Push changes to main branch to trigger automatic deployment
- Terraform will initialize, plan, and apply changes automatically

### Customization
Modify `variables.tf` or provide terraform.tfvars to customize:
- AMI ID for different OS images
- Instance type for different compute requirements
- Subnet for VPC placement

## Important Notes
- **Auto-approve**: The workflow uses `-auto-approve` flag, which automatically applies changes without manual approval
- **Region**: Fixed to us-east-1 (modify in provider.tf if needed)
- **Security**: Ensure AWS credentials are properly managed as GitHub secrets

## For Claude/AI Assistance
When asking for help with this project, please specify:
- Whether you need help with Terraform configuration
- CI/CD pipeline modifications
- AWS resource management
- Workflow debugging or optimization
- Security and best practices reviews