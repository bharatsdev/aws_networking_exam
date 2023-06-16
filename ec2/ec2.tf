resource "aws_instance" "Bastion_ec2" {
  ami             = var.aws_ami_id
  instance_type   = "t2.micro"
  key_name        = var.tf_key_name
  subnet_id       = var.public_subnet_id
  security_groups = [var.public_sg_id]
  associate_public_ip_address = true

  tags = {
    "Name" = "BASTAIN_HOST"
    "VPC"  = "AWS_NETWORKING"
  }
}

resource "aws_instance" "private_ec2" {
  ami             = var.aws_ami_id
  instance_type   = "t2.micro"
  key_name        = var.tf_key_name
  subnet_id       = var.private_subnet_id
  security_groups = [var.private_sg_id]


  tags = {
    "Name" = "PRIVATE-EC2_HOST"
    "VPC"  = "AWS_NETWORKING_EXAM_IGW"
  }
}



