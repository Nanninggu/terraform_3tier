resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"  # 보안 그룹 이름 설정
  description = "Allow SSH inbound traffic"  # 보안 그룹 설명 설정
  vpc_id      = var.vpc_id  # VPC ID 설정

  ingress {
    from_port = 22  # 시작 포트 설정 (22번 포트)
    to_port   = 22  # 종료 포트 설정 (22번 포트)
    protocol  = "tcp"  # 프로토콜 설정 (TCP)
    cidr_blocks = ["0.0.0.0/0"]  # 허용할 CIDR 블록 설정 (모든 IP)
  }

  ingress {
    from_port = 0  # 시작 포트 설정 (모든 포트)
    to_port   = 0  # 종료 포트 설정 (모든 포트)
    protocol  = "-1"  # 프로토콜 설정 (모든 프로토콜)
    cidr_blocks = ["0.0.0.0/0"]  # 허용할 CIDR 블록 설정 (모든 IP)
  }

  egress {
    from_port = 0  # 시작 포트 설정 (모든 포트)
    to_port   = 0  # 종료 포트 설정 (모든 포트)
    protocol  = "-1"  # 프로토콜 설정 (모든 프로토콜)
    cidr_blocks = ["0.0.0.0/0"]  # 허용할 CIDR 블록 설정 (모든 IP)
  }

  tags = {
    Name = "allow_ssh"  # 태그 이름 설정
  }
}