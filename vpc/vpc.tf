resource "aws_vpc" "network_vpc" {
  cidr_block           = "10.100.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "AWS_NETWORKING_EXAM"
  }
}
