# Configure Database Security Group
resource "aws_security_group" "database_sg" {
  name        = "Database-SG"
  description = "Allow Database inbound traffic"
  vpc_id      = aws_vpc.main_vpc.id
}
# Configure Web Server Security Group
resource "aws_security_group" "web_server_sg" {
  name        = "Web-Server-SG"
  description = "Allow Web Server inbound traffic"
  vpc_id      = aws_vpc.main_vpc.id
}