# aws provider 생성
provider "aws" {
  region = "ap-northeast-2" # AWS 리전 설정
}

# vpc 모듈 생성
module "vpc" {
  source                             = "./modules/vpc"                               # VPC 모듈 소스 경로
  nat_interface_network_interface_id = module.ec2.nat_interface_network_interface_id # EC2 모듈에서 NAT 인터페이스 ID 가져오기
}

module "subnet" {
  source          = "./modules/subnet"         # 서브넷 모듈 소스 경로
  vpc_id          = module.vpc.vpc_id          # VPC 모듈에서 VPC ID 가져오기
  route_table_id  = module.vpc.route_table_id  # VPC 모듈에서 라우트 테이블 ID 가져오기
  route_table_id1 = module.vpc.route_table_id1 # VPC 모듈에서 라우트 테이블 ID 가져오기 (추가 영상)
}

module "security-group" {
  source = "./modules/security-group" # 보안 그룹 모듈 소스 경로
  vpc_id = module.vpc.vpc_id          # VPC 모듈에서 VPC ID 가져오기
}

module "key_pair" {
  source = "./modules/key-pair" # 키 페어 모듈 소스 경로
}

module "ec2" {
  source             = "./modules/ec2"                         # EC2 모듈 소스 경로
  security_group_id  = module.security-group.security_group_id # 보안 그룹 모듈에서 보안 그룹 ID 가져오기
  public_subnet_ids  = module.subnet.public_subnet_ids         # 서브넷 모듈에서 퍼블릭 서브넷 ID 가져오기
  private_subnet_ids = module.subnet.private_subnet_ids        # 서브넷 모듈에서 프라이빗 서브넷 ID 가져오기
  key_name           = module.key_pair.key_name                # 키 페어 이름 설정
}

module "s3" {
  source      = "./modules/s3"                  # S3 모듈 소스 경로
  bucket_name = "my-unique-bucket-name-sionkim" # S3 버킷 이름 설정
  acl         = "private"                       # S3 버킷의 ACL 설정 (private)
}

module "rds" {
  source                 = "./modules/rds"                           # RDS 모듈 소스 경로
  db_name                = "mydatabase"                              # 데이터베이스 이름 설정
  username               = "postgres"                                # 데이터베이스 사용자 이름 설정
  password               = "test1234"                                # 데이터베이스 비밀번호 설정
  vpc_security_group_ids = [module.security-group.security_group_id] # VPC 보안 그룹 ID 설정
  subnet_ids             = module.subnet.private_subnet_ids          # 서브넷 ID 설정
}

module "alb" {
  source             = "./modules/alb"                           # ALB 모듈 소스 경로
  vpc_id             = module.vpc.vpc_id                         # VPC ID 설정
  subnet_ids         = module.subnet.public_subnet_ids           # 서브넷 ID 설정
  security_group_ids = [module.security-group.security_group_id] # 보안 그룹 ID 설정
  target_instance_ids = [
    # 타겟 인스턴스 ID 설정
    module.ec2.web1_id, # 첫 번째 웹 인스턴스 ID
    module.ec2.web2_id  # 두 번째 웹 인스턴스 ID
  ]
}