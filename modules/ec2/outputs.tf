output "nat_interface_network_interface_id" {
  value = aws_instance.nat_instance.primary_network_interface_id  # NAT 인스턴스의 기본 네트워크 인터페이스 ID 출력
}

output "web1_id" {
  value = aws_instance.web1.id  # 웹 서버 1의 인스턴스 ID 출력
}

output "web2_id" {
  value = aws_instance.web2.id  # 웹 서버 2의 인스턴스 ID 출력
}