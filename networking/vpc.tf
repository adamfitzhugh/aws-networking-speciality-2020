module "vpc" {
  source = "git::https://github.com/adamfitzhugh/aws-terraform-vpc-module.git"

  name = var.name
  cidr_block       = var.cidr_block
  azs = var.azs
  private_subnets = var.private_subnets
}