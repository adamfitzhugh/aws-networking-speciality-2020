# Configure the main VPC
resource "aws_vpc" "main_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Primary VPC"
  }
}

# Configure Database subnets
resource "aws_subnet" "database_subnet" {
  count = length(var.database_subnets)
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.database_subnets[count.index]

  tags = {
    Name = "Database Subnet"
  }
}

# Configure Web Server subnets
resource "aws_subnet" "web_server_subnet" {
  count = length(var.web_server_subnets)
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.web_server_subnets[count.index]

  tags = {
    Name = "Web Server Subnet"
  }
}