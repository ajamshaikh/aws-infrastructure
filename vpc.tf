# Create VPC
resource "aws_vpc" "my-vpc1" {
  cidr_block           = "10.0.1.0/28"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "My-VPC1"
  }
}