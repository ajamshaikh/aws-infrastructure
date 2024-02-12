# Create Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.my-vpc1.id
  cidr_block              = "10.0.0.0/26"
  availability_zone       = "us-east-1a" 
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet1"
  }
}

# Create Private Subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.my-vpc1.id
  cidr_block        = "10.0.0.64/26"
  availability_zone = "us-east-1b" 

  tags = {
    Name = "Private-Subnet1"
  }
}
