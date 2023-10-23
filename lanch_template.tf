resource "aws_launch_template" "launch_template" {
  name_prefix   = "my-launch-template"
  image_id      = "ami-00187358fd8391652"
  instance_type = "t2.micro"
  key_name = "key-pair-01"

  network_interfaces {
    associate_public_ip_address = true
    subnet_id = aws_subnet.public_subnet_01.id
    security_groups = [aws_security_group.vpn_sg.id]
  }
}