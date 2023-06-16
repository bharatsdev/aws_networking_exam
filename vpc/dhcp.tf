resource "aws_vpc_dhcp_options" "my_vpc_dhcp" {

  domain_name         = "corp.internal"
  domain_name_servers = ["AmazondProvidedDNS"]


  tags = {
    "Name" : "My_DHCP_OPTIONS"
  }
}
