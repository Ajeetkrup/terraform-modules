# AWS Multi-Environment Infrastructure with Terraform

This Terraform configuration creates AWS infrastructure (EC2, S3, DynamoDB) across multiple environments (dev, staging, prod) using a reusable module approach.

## Architecture Overview

The infrastructure is deployed across three environments:
- **Development (dev)**: 1 t2.micro EC2 instance
- **Staging (stg)**: 1 t2.micro EC2 instance  
- **Production (prod)**: 2 t2.medium EC2 instances

Each environment includes:
- EC2 instances with Apache web server
- S3 bucket for storage
- DynamoDB table with userId as hash key

## Project Structure

```
├── main.tf              # Environment module definitions
├── terraform.tf         # Terraform configuration
├── providers.tf         # AWS provider configuration
└── app/                 # Reusable infrastructure module
    ├── ec2.tf          # EC2 instances and key pairs
    ├── s3.tf           # S3 bucket configuration
    ├── dynamodb.tf     # DynamoDB table configuration
    ├── variables.tf    # Module input variables
    └── install-apache.tf # Apache installation script
```

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.0 installed
- AWS account with necessary permissions for EC2, S3, and DynamoDB

## Module Variables

The `app` module accepts the following variables:

| Variable | Type | Description | Example |
|----------|------|-------------|---------|
| `env` | string | Environment name | "dev", "stg", "prod" |
| `hash_key` | string | DynamoDB table hash key | "userId" |
| `cnt` | number | Number of EC2 instances | 1, 2 |
| `ec2_ami` | string | AMI ID for EC2 instances | "ami-09e6f87a47903347c" |
| `ec2_instance_type` | string | EC2 instance type | "t2.micro", "t2.medium" |

## Usage

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Plan the deployment
```bash
terraform plan
```

### 3. Apply the configuration
```bash
terraform apply
```

### 4. Destroy resources (when needed)
```bash
terraform destroy
```

## Environment Configuration

### Development Environment
- **Instances**: 1 x t2.micro
- **Purpose**: Development and testing
- **Cost**: Optimized for minimal cost

### Staging Environment  
- **Instances**: 1 x t2.micro
- **Purpose**: Pre-production testing
- **Cost**: Minimal cost for testing

### Production Environment
- **Instances**: 2 x t2.medium
- **Purpose**: Production workloads
- **High Availability**: Multiple instances for redundancy

## Resources Created

For each environment, the following AWS resources are created:

### EC2 Resources
- EC2 instances (count based on environment)
- Key pair for SSH access
- Security groups for web traffic
- Apache web server installation

### S3 Resources
- S3 bucket with environment-specific naming
- Bucket versioning and access controls

### DynamoDB Resources
- DynamoDB table with userId hash key
- Environment-specific table naming
- Provisioned throughput configuration

## Security Considerations

- EC2 instances use key pairs for secure SSH access
- Security groups restrict access to necessary ports only
- S3 buckets follow AWS security best practices
- DynamoDB tables use appropriate access controls

## Customization

To modify the infrastructure:

1. **Change instance types**: Update `ec2_instance_type` in module calls
2. **Adjust instance count**: Modify `cnt` parameter for each environment
3. **Update AMI**: Change `ec2_ami` to use different Amazon Machine Images
4. **Add new environments**: Create new module blocks in `main.tf`

## Monitoring and Maintenance

- Monitor AWS costs through AWS Cost Explorer
- Regularly update AMIs for security patches
- Review and update security groups as needed
- Monitor DynamoDB read/write capacity utilization

## Troubleshooting

### Common Issues

1. **AMI not found**: Ensure AMI ID is valid for your AWS region
2. **Permission denied**: Verify AWS credentials have necessary permissions
3. **Resource limits**: Check AWS service limits for your account
4. **File path errors**: Ensure all referenced files exist in correct locations

### Useful Commands

```bash
# Check current state
terraform show

# List all resources
terraform state list

# Get specific resource information
terraform state show <resource_name>

# Format code
terraform fmt

# Validate configuration
terraform validate
```

## Contributing

When making changes to this infrastructure:

1. Test changes in development environment first
2. Use `terraform plan` to review changes before applying
3. Document any new variables or resources
4. Follow naming conventions for consistency

## Cost Optimization

- Development and staging use t2.micro instances (free tier eligible)
- Production uses appropriately sized t2.medium instances
- Consider using spot instances for non-production environments
- Regularly review and optimize resource utilization