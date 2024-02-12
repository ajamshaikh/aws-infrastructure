# Create Instances
resource "aws_instance" "public_instance" {
  ami                         = "ami-0e731c8a588258d0d" # Amazon Linux 2 AMI ID
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  security_groups             = [aws_security_group.public_sg.id]
  key_name                    = "ajam-key" # Change to your key pair name
  associate_public_ip_address = true

  tags = {
    Name = "PublicInstance"
  }
}

resource "aws_instance" "private_instance" {
  ami             = "ami-0e731c8a588258d0d" # Amazon Linux 2 AMI ID
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.private.id
  security_groups = [aws_security_group.private_sg.id]
  key_name        = "ajam-key" # Change to your key pair name

  tags = {
    Name = "PrivateInstance"
  }
}