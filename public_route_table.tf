resource "aws_route_table" "public_route_table" {
	vpc_id = aws_vpc.vpc.id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.internet_gateway.id
	}

	route {
		cidr_block = "10.33.0.0/24"
		gateway_id = aws_vpn_gateway.vpn_gateway.id
	}

	tags = {
		Name = "public_route_table"
	}
}

resource "aws_route_table_association" "public_route_table_01" {
	route_table_id = aws_route_table.public_route_table.id
	subnet_id = aws_subnet.public_subnet_01.id
}

resource "aws_route_table_association" "public_route_table_02" {
	route_table_id = aws_route_table.public_route_table.id
	subnet_id = aws_subnet.public_subnet_02.id
}