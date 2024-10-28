resource "aws_db_instance" "this" {
  identifier             = var.db_name
  engine                 = "postgres"
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  username               = var.username
  password               = var.password
  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.this.name

  # DB 인스턴스를 삭제하기 전에 최종 스냅샷을 생성해야 한다는 것을 의미!! (추가 영상)
  # skip_final_snapshot    = true
  # final_snapshot_identifier = "${var.db_name}-final-snapshot"
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.db_name}-subnet-group"
  }
}