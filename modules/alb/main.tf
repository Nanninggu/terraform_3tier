resource "aws_lb" "this" {
  name                       = "my-alb"               # 로드 밸런서 이름 설정
  internal                   = false                  # 내부 로드 밸런서 여부 설정 (false는 외부)
  load_balancer_type         = "application"          # 로드 밸런서 유형 설정 (application)
  security_groups            = var.security_group_ids # 보안 그룹 ID 설정
  subnets                    = var.subnet_ids         # 서브넷 ID 설정
  enable_deletion_protection = false                  # 삭제 보호 기능 비활성화
}

resource "aws_lb_target_group" "this" {
  name     = "my-target-group" # 타겟 그룹 이름 설정
  port     = 8080              # 타겟 그룹 포트 설정
  protocol = "HTTP"            # 타겟 그룹 프로토콜 설정
  vpc_id   = var.vpc_id        # VPC ID 설정

  health_check {
    path                = "/"    # 헬스 체크 경로 설정
    protocol            = "HTTP" # 헬스 체크 프로토콜 설정
    interval            = 30     # 헬스 체크 간격 설정 (초)
    timeout             = 5      # 헬스 체크 타임아웃 설정 (초)
    healthy_threshold   = 2      # 헬스 체크 성공 임계값 설정
    unhealthy_threshold = 2      # 헬스 체크 실패 임계값 설정
  }
  # 고정 세션 활성화!! (추가 영상)
  stickiness {
    type            = "lb_cookie"
    cookie_duration = 86400 # 1 day in seconds
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn # 로드 밸런서 ARN 설정
  port              = 8080            # 리스너 포트 설정
  protocol          = "HTTP"          # 리스너 프로토콜 설정

  default_action {
    type             = "forward"                    # 기본 액션 유형 설정 (forward)
    target_group_arn = aws_lb_target_group.this.arn # 타겟 그룹 ARN 설정
  }
}

resource "aws_lb_target_group_attachment" "web1" {
  target_group_arn = aws_lb_target_group.this.arn # 타겟 그룹 ARN 설정
  target_id        = var.target_instance_ids[0]   # 첫 번째 타겟 인스턴스 ID 설정
  port             = 8080                         # 타겟 포트 설정
}

resource "aws_lb_target_group_attachment" "web2" {
  target_group_arn = aws_lb_target_group.this.arn # 타겟 그룹 ARN 설정
  target_id        = var.target_instance_ids[1]   # 두 번째 타겟 인스턴스 ID 설정
  port             = 8080                         # 타겟 포트 설정
}