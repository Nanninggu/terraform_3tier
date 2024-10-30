output "alb_dns_name" {        # 출력 변수 "alb_dns_name" 정의
  value = aws_lb.this.dns_name # 출력 값으로 로드 밸런서의 DNS 이름 설정
}