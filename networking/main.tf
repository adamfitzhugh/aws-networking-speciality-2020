module "vpc" {
  source = "../modules/vpc"

  primary_cidr       = var.primary_cidr
  database_subnets   = var.database_subnets
  web_server_subnets = var.web_server_subnets
}