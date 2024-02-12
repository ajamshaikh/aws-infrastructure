# Create Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.my-vpc1.id
  cidr_block              = "10.0.1.0/28"
  availability_zone       = "us-east-1a" # Change to your desired AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet1"
  }
}

# Create Private Subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.my-vpc1.id
  cidr_block        = "10.0.2.0/28"
  availability_zone = "us-east-1b" # Change to your desired AZ

  tags = {
    Name = "Private-Subnet1"
  }
}
