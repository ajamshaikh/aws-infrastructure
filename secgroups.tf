# Create Security Groups
resource "aws_security_group" "public_sg" {
  vpc_id = aws_vpc.my-vpc1.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.my-vpc1.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Configure Security Group Rules
resource "aws_security_group_rule" "public_sg_ingress" {
  security_group_id = aws_security_group.public_sg.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["109.76.233.9/32"] # Change to your public IP
}

resource "aws_security_group_rule" "private_sg_ingress" {
  security_group_id        = aws_security_group.private_sg.id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.public_sg.id
}
