# Create Internet Gateway
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.my-vpc1.id
  

  tags = {
    Name = "My-IGW"
  }
}