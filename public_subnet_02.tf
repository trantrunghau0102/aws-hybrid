resource "aws_subnet" "public_subnet_02" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.22.12.0/24"
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "public_subnet_02"
  }
}