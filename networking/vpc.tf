module "vpc" {
  source = "git::https://github.com/adamfitzhugh/aws-terraform-vpc-module.git"

  name = "Primary VPC"
  primary_cidr       = var.primary_cidr
  azs = var.azs
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}