variable "region" {
  description = "Default VPC region"
  type        = string
  default     = "eu-west-2"
}
variable "primary_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
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