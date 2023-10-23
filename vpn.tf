resource "aws_vpn_gateway" "vpn_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "VPN_Gateway"
  }
}

resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn    = 65000
  ip_address = "210.245.17.235"
  type = "ipsec.1"
  tags = {
    Name = "Customer_Gateway"
  }
}

resource "aws_vpn_connection" "vpn_connection" {
  customer_gateway_id = aws_customer_gateway.customer_gateway.id
  vpn_gateway_id     = aws_vpn_gateway.vpn_gateway.id
  type               = "ipsec.1"
  static_routes_only = true

  local_ipv4_network_cidr = "10.33.0.0/24"
  remote_ipv4_network_cidr = "10.22.0.0/16"


  tags = {
    Name = "AWS_to_VPS"
  }
}

resource "aws_vpn_connection_route" "vps-route" {
  vpn_connection_id = aws_vpn_connection.vpn_connection.id
  destination_cidr_block = "10.33.0.0/24"
}