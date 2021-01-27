# Configure the main VPC
resource "aws_vpc" "main_vpc" {
  cidr_block       = var.primary_cidr
  instance_tenancy = "default"

  tags = {
    Name = "Primary VPC"
  }
}

# Configure Database subnets
resource "aws_subnet" "database_subnet" {
  count             = length(var.database_subnets)
  availability_zone = var.azs[count.index]
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.database_subnets[count.index]

  tags = {
    Name = "Database Subnet"
  }
}

# Configure Web Server subnets
resource "aws_subnet" "web_server_subnet" {
  count             = length(var.web_server_subnets)
  availability_zone = var.azs[count.index]
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.web_server_subnets[count.index]

  tags = {
    Name = var.azs[count.index] - "Web Server Subnet"
  }
}