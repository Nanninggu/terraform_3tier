resource "aws_lb" "this" {
  name                       = "my-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = var.security_group_ids
  subnets                    = var.subnet_ids
  enable_deletion_protection = false
}

resource "aws_lb_target_group" "this" {
  name     = "my-target-group"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  # 고정 세션 활성화!! (추가 영상)
  # stickiness {
  #   type            = "lb_cookie"
  #   cookie_duration = 86400  # 1 day in seconds
  # }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group_attachment" "web1" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.target_instance_ids[0]
  port             = 8080
}

resource "aws_lb_target_group_attachment" "web2" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.target_instance_ids[1]
  port             = 8080
}

