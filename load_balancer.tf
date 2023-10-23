resource "aws_lb" "load_balancer" {
  name               = "my-load-balancer"
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_subnet_01.id, aws_subnet.public_subnet_02.id]
  security_groups    = [aws_security_group.vpn_sg.id]

}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}