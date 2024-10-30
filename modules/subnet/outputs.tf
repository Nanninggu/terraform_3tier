output "public_subnet_ids" {
  value = [aws_subnet.public1.id, aws_subnet.public2.id] # 퍼블릭 서브넷 ID 출력
}

output "private_subnet_ids" {
  value = [aws_subnet.private1.id, aws_subnet.private2.id] # 프라이빗 서브넷 ID 출력
}