module "vpc" {
  source = "git::https://github.com/adamfitzhugh/aws-terraform-vpc-module.git"

  name = "Primary VPC"
  primary_cidr       = var.primary_cidr
  azs = var.azs
  private_subnets = var.private_subnets
}