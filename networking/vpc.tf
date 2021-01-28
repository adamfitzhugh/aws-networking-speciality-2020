module "vpc" {
  #source = "../modules/vpc"
  source = "git::https://github.com/adamfitzhugh/aws-terraform-vpc-module.git"

  primary_cidr       = var.primary_cidr
  azs = var.azs
  database_subnets   = var.database_subnets
  web_server_subnets = var.web_server_subnets
}