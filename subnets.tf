resource "aws_subnet" "private-ap-south-1a" {
  vpc_id     = aws_vpc.vms.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    "Name"                                      = "private-ap-south-1a"
    "kubernetes.io/role/internal-elb"           = "1"   
    "kubernetes.io/cluster/$(var.cluster_name)" = "owned"
  }
}

resource "aws_subnet" "private-ap-south-1b" {
  vpc_id     = aws_vpc.vms.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    "Name"                                      = "private-ap-south-1b"
    "kubernetes.io/role/internal-elb"           = "1"   
    "kubernetes.io/cluster/$(var.cluster_name)" = "owned"
  }
}

resource "aws_subnet" "public-ap-south-1a" {
  vpc_id     = aws_vpc.vms.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-ap-south-1a"
    "kubernetes.io/role/elb"                    = "1"   
    "kubernetes.io/cluster/$(var.cluster_name)" = "owned"
  }
}

resource "aws_subnet" "public-ap-south-1b" {
  vpc_id     = aws_vpc.vms.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-ap-south-1b"
    "kubernetes.io/role/elb"                    = "1"   
    "kubernetes.io/cluster/$(var.cluster_name)" = "owned"
  }
}

