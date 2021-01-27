variable "region" {
  description = "Default VPC region"
  type        = string
  default     = "eu-west-2"
}
variable "primary_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = ""
}
variable "database_subnets" {
  description = "List of database subnets"
  type        = list(any)
  default     = []
}
variable "web_server_subnets" {
  description = "List of web server subnets"
  type        = list(any)
  default     = []
}