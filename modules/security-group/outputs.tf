output "security_group_id" {
  value = aws_security_group.allow_ssh.id # 보안 그룹 ID 출력
}