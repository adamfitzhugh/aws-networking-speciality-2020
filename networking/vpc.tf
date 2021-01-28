module "vpc" {
  source = "../modules/vpc"

  primary_cidr       = var.primary_cidr
  azs = var.azs
  database_subnets   = var.database_subnets
  web_server_subnets = var.web_server_subnets
  region = var.region
}