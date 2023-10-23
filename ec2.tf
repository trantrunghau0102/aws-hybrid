# resource "aws_instance" "ec2-01" {
#   ami = ""
#   instance_type = "t2.micro"
  
#   subnet_id = aws_subnet.public_subnet.id
#   associate_public_ip_address = true

#   vpc_security_group_ids = [aws_security_group.vpn_sg]

#   user_data = ""

#   tags = {
#     Name = "ec2-01"
#   }
# }