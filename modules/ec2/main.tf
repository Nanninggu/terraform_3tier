resource "aws_instance" "bastion_host" {
  ami                    = "ami-040c33c6a51fd5d96"  # AMI ID 설정
  instance_type          = "t2.micro"               # 인스턴스 유형 설정
  subnet_id              = var.public_subnet_ids[0] # 서브넷 ID 설정
  vpc_security_group_ids = [var.security_group_id]  # 보안 그룹 ID 설정
  availability_zone      = "ap-northeast-2a"        # 가용 영역 설정
  key_name               = var.key_name             # 키 페어 이름 설정

  tags = {
    Name = "bastion_host" # 태그 이름 설정
  }
}

resource "aws_instance" "nat_instance" {
  ami                    = "ami-0c2d3e23e757b5d84"  # AMI ID 설정
  instance_type          = "t2.micro"               # 인스턴스 유형 설정
  subnet_id              = var.public_subnet_ids[1] # 서브넷 ID 설정
  vpc_security_group_ids = [var.security_group_id]  # 보안 그룹 ID 설정
  availability_zone      = "ap-northeast-2c"        # 가용 영역 설정
  key_name               = var.key_name             # 키 페어 이름 설정
  source_dest_check      = false                    # 소스/대상 확인 비활성화

  tags = {
    Name = "nat_instance" # 태그 이름 설정
  }
}

resource "aws_instance" "web1" {
  ami                    = "ami-040c33c6a51fd5d96"   # AMI ID 설정
  instance_type          = "t2.micro"                # 인스턴스 유형 설정
  subnet_id              = var.private_subnet_ids[0] # 서브넷 ID 설정
  vpc_security_group_ids = [var.security_group_id]   # 보안 그룹 ID 설정
  availability_zone      = "ap-northeast-2a"         # 가용 영역 설정
  key_name               = var.key_name              # 키 페어 이름 설정

  tags = {
    Name = "web1" # 태그 이름 설정
  }
}

resource "aws_instance" "web2" {
  ami                    = "ami-040c33c6a51fd5d96"   # AMI ID 설정
  instance_type          = "t2.micro"                # 인스턴스 유형 설정
  subnet_id              = var.private_subnet_ids[1] # 서브넷 ID 설정
  vpc_security_group_ids = [var.security_group_id]   # 보안 그룹 ID 설정
  availability_zone      = "ap-northeast-2c"         # 가용 영역 설정
  key_name               = var.key_name              # 키 페어 이름 설정

  tags = {
    Name = "web2" # 태그 이름 설정
  }
}