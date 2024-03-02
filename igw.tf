resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vms.id

  tags = {
    Name = "igw"
  }
}