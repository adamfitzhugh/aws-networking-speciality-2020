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
variable "name" {
  description = "The name of the resource"
  type        = string
  default     = ""
}

# Subnet Vars
variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}