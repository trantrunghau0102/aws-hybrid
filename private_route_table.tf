resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "private_route_table"
  }
}

resource "aws_route_table_association" "private_route_table_01" {
  subnet_id = aws_subnet.private_subnet_01.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_route_table_02" {
  subnet_id = aws_subnet.private_subnet_02.id
  route_table_id = aws_route_table.private_route_table.id
}