resource "tls_private_key" "example" {
  algorithm = "RSA"  # 알고리즘을 RSA로 설정
  rsa_bits  = 2048  # RSA 키 길이를 2048 비트로 설정
}

resource "aws_key_pair" "my_key" {
  key_name   = "my_key"  # 키 페어 이름을 "my_key"로 설정
  public_key = tls_private_key.example.public_key_openssh  # 공개 키를 tls_private_key.example.public_key_openssh로 설정
}

resource "local_file" "private_key" {
  content  = tls_private_key.example.private_key_pem  # 파일 내용으로 개인 키를 설정
  filename = "${path.module}/my_key.pem"  # 파일 이름을 모듈 경로의 "my_key.pem"으로 설정
}