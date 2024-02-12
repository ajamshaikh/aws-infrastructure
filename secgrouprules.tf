# Configure Security Group Rules
resource "aws_security_group_rule" "public_sg_ingress" {
  security_group_id = aws_security_group.public_sg.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["93.107.90.239/32"] # Change to your public IP
}

resource "aws_security_group_rule" "private_sg_ingress" {
  security_group_id        = aws_security_group.private_sg.id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.public_sg.id
}
