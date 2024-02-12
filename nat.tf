# Allocate Elastic IP Address 
# terraform aws allocate elastic ip
resource "aws_eip" "eip-for-nat-gateway-1" {
  vpc    = true

  tags   = {
    Name = "EIP 1"
  }
}


# terraform create aws nat gateway
resource "aws_nat_gateway" "nat-gateway-1" {
  allocation_id = aws_eip.eip-for-nat-gateway-1.id
  subnet_id     = aws_subnet.public.id

  tags   = {
    Name = "Nat Gateway Public Subnet 1"
  }
}

# terraform aws create route table
resource "aws_route_table" "private-route-table-1" {
        vpc_id = aws_vpc.my-vpc1.id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat-gateway-1.id
  }

  tags   = {
    Name = "Private Route Table 1"
  }
}

# terraform aws associate subnet with route table
resource "aws_route_table_association" "private-subnet-1-route-table-association" {
  subnet_id         = aws_subnet.private.id
  route_table_id    = aws_route_table.private-route-table-1.id
}

resource "aws_route_table" "Public_Route" {
  vpc_id = aws_vpc.my-vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
    #route = aws_subnet.public.subnet_id
  }

  tags = {
    Name = "Public-route-table"
  }
}
