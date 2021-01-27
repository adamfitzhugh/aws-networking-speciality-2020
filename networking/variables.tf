# main.tf Vars
variable "region" {
  description = "Default AWS Region"
  type    = string
  default = "eu-west-2"
}

# VPC Vars
variable "primary_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Subnet Vars
variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}
variable "database_subnets" {
  description = "List of database subnets"
  type        = list(any)
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
}
variable "web_server_subnets" {
  description = "List of web server subnets"
  type        = list(any)
  default     = ["10.0.2.0/24", "10.0.4.0/24"]
}