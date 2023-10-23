resource "aws_autoscaling_group" "asg" {
  name                      = "my-asg"
  min_size                  = 0
  max_size                  = 4
  desired_capacity          = 0
  
  vpc_zone_identifier = [aws_subnet.public_subnet_01.id, aws_subnet.public_subnet_02.id]
  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.target_group.arn]
  health_check_type = "ELB"

  default_instance_warmup = 300
}
