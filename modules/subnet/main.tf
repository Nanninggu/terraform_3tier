# public subnet 1 생성
resource "aws_subnet" "public1" {
  vpc_id                  = var.vpc_id        # VPC ID 설정
  cidr_block              = "10.0.1.0/24"     # CIDR 블록 설정
  map_public_ip_on_launch = true              # 퍼블릭 IP 자동 할당 설정
  availability_zone       = "ap-northeast-2a" # 가용 영역 설정

  tags = {
    Name = "public-subnet-1" # 서브넷의 태그 설정
  }
}

# public subnet 2 생성
resource "aws_subnet" "public2" {
  vpc_id                  = var.vpc_id        # VPC ID 설정
  cidr_block              = "10.0.2.0/24"     # CIDR 블록 설정
  map_public_ip_on_launch = true              # 퍼블릭 IP 자동 할당 설정
  availability_zone       = "ap-northeast-2c" # 가용 영역 설정

  tags = {
    Name = "public-subnet-2" # 서브넷의 태그 설정
  }
}

# private subnet 1 생성
resource "aws_subnet" "private1" {
  vpc_id            = var.vpc_id        # VPC ID 설정
  cidr_block        = "10.0.3.0/24"     # CIDR 블록 설정
  availability_zone = "ap-northeast-2a" # 가용 영역 설정

  tags = {
    Name = "private-subnet-1" # 서브넷의 태그 설정
  }
}

# private subnet 2 생성
resource "aws_subnet" "private2" {
  vpc_id            = var.vpc_id        # VPC ID 설정
  cidr_block        = "10.0.4.0/24"     # CIDR 블록 설정
  availability_zone = "ap-northeast-2c" # 가용 영역 설정

  tags = {
    Name = "private-subnet-2" # 서브넷의 태그 설정
  }
}

# public subnet 1과 라우트 테이블 연결
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public1.id # 퍼블릭 서브넷 1의 ID 설정
  route_table_id = var.route_table_id    # 라우트 테이블 ID 설정
}

# public subnet 2와 라우트 테이블 연결
resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public2.id # 퍼블릭 서브넷 2의 ID 설정
  route_table_id = var.route_table_id    # 라우트 테이블 ID 설정
}

# private subnet 1과 라우트 테이블 연결 (추가 영상)
resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private1.id # 프라이빹 서브넷 1의 ID 설정
  route_table_id = var.route_table_id1    # 라우트 테이블 ID 설정
}

# private subnet 2와 라우트 테이블 연결 (추가 영상)
resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private2.id # 프라이빹 서브넷 2의 ID 설정
  route_table_id = var.route_table_id1    # 라우트 테이블 ID 설정
}