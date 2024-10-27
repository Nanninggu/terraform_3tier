output "vpc_id" {
  value = aws_vpc.main.id  # VPC의 ID를 출력 값으로 설정
}

output "route_table_id" {
  value = aws_route_table.main.id  # 라우트 테이블의 ID를 출력 값으로 설정
}