resource "aws_vpc" "vms" {
  cidr_block = "10.0.0.0/16"

  #Must be enabled for EFS
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "VMS"
  }
}