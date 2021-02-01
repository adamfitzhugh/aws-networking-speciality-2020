# main.tf Vars
variable "region" {
  description = "Default AWS Region"
  type        = string
  default     = "eu-west-2"
}

# VPC Vars
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "name" {
  description = "The name of the resource"
  type        = string
  default     = "Primary VPC"
}

# Subnet Vars
variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}
variable "private_subnets" {
  description = "List of private subnets"
  type        = list(any)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}