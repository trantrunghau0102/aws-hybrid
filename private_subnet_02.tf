resource "aws_subnet" "private_subnet_02" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.22.22.0/24"
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet_02"
  }
}

# resource "aws_default_subnet" "default_subnet" {
#   availability_zone = "us-east-1b"  # Replace with the desired availability zone
# }