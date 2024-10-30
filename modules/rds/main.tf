resource "aws_db_instance" "this" {
  identifier             = var.db_name                   # DB 인스턴스 식별자 설정
  engine                 = "postgres"                    # DB 엔진 설정 (PostgreSQL)
  instance_class         = var.instance_class            # 인스턴스 클래스 설정
  allocated_storage      = var.allocated_storage         # 할당된 스토리지 설정
  username               = var.username                  # DB 사용자 이름 설정
  password               = var.password                  # DB 비밀번호 설정
  vpc_security_group_ids = var.vpc_security_group_ids    # VPC 보안 그룹 ID 설정
  db_subnet_group_name   = aws_db_subnet_group.this.name # DB 서브넷 그룹 이름 설정

  # DB 인스턴스를 삭제하기 전에 최종 스냅샷을 생성해야 한다는 것을 의미!! (추가 영상)
  skip_final_snapshot       = true                            # 최종 스냅샷 생성을 건너뜀
  final_snapshot_identifier = "${var.db_name}-final-snapshot" # 최종 스냅샷 식별자 설정
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.db_name}-subnet-group" # 서브넷 그룹 이름 설정
  subnet_ids = var.subnet_ids                # 서브넷 ID 설정

  tags = {
    Name = "${var.db_name}-subnet-group" # 태그 이름 설정
  }
}