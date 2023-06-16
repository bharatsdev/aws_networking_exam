resource "aws_subnet" "private_subnet" {

  cidr_block        = "10.100.1.0/24"
  vpc_id            = aws_vpc.network_vpc.id
  availability_zone = "ap-south-1a"

  tags = {
    "Name" = "privateSubnet1"
    "VPC"  = "AWS_NETWORKING_EXAM_IGW"
  }
}

resource "aws_route_table" "privateRouteTable1" {
  vpc_id = aws_vpc.network_vpc.id
  route {
    cidr_block     = "0.0.0.0/16"
    nat_gateway_id = aws_nat_gateway.private_nat_gateway.id
  }
  tags = {
    "Name" = "privateRouteTable1"
    "VPC"  = "AWS_NETWORKING_EXAM_IGW"
  }
}
resource "aws_route_table_association" "privateRouteTable1_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.privateRouteTable1.id
  depends_on     = [aws_subnet.private_subnet]
}
resource "aws_nat_gateway" "private_nat_gateway" {
  subnet_id         = aws_subnet.public_subnet.id
  connectivity_type = "public"
  allocation_id     = aws_eip.eip.id

}
resource "aws_eip" "eip" {

}

resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.network_vpc.id
  name   = "PRIVATE_SG"
  ingress {
    protocol    = "tcp"
    to_port     = 22
    from_port   = 22
    cidr_blocks = ["10.100.0.0/16"]
  }
  ingress {
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
    cidr_blocks = ["10.100.0.0/16"]
  }

  ingress {
    protocol        = "-1"
    from_port       = 0
    to_port         = 0
    security_groups = [aws_security_group.public_sg.id]
    description     = "Allow all traffic from Public security group s"
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = -1
  }
  tags = {
    "Name" = "PrivateSG"
    "VPC"  = "AWS_NETWORKING_EXAM_IGW"
  }
}
