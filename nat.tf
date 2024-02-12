
# Create NAT Gateway
/*resource "aws_nat_gateway" "main" {
  # allocation_id = aws_instance.public_instance.network_interface # Assuming the public instance has a single network interface 
  subnet_id = aws_subnet.private.id
  connectivity_type = "public"
  #allocation_id = "eipalloc-00ecc2f3c529243b6"

  tags = {
    Name = "MyNAT1"
  }
}*/

# Allocate Elastic IP Address (EIP 1)
# terraform aws allocate elastic ip
resource "aws_eip" "eip-for-nat-gateway-1" {
  vpc    = true

  tags   = {
    Name = "EIP 1"
  }
}

# Create Nat Gateway 1 in Public Subnet 1
# terraform create aws nat gateway
resource "aws_nat_gateway" "nat-gateway-1" {
  allocation_id = aws_eip.eip-for-nat-gateway-1.id
  subnet_id     = aws_subnet.public.id

  tags   = {
    Name = "Nat Gateway Public Subnet 1"
  }
}

# Create Private Route Table 1 and Add Route Through Nat Gateway 1
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

# Associate Private Subnet 1 with "Private Route Table 1"
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