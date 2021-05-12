module "vpc" {
  source = "git::https://github.com/adamfitzhugh/aws-terraform-vpc-module.git"

  name = "my-vpc"
  cidr_block       = var.cidr_block
  azs = var.azs
  private_subnets = var.private_subnets
}

# Configure NACL
# Configure Route tables
# Configure IGW
# Configure NGW
# Configure VPC endpoints
# VPC Peering