resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16" # VPC의 CIDR 블록 설정

  tags = {
    Name = "my-vpc" # VPC의 태그 설정
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id # VPC ID를 인터넷 게이트웨이에 연결

  tags = {
    Name = "my-igw" # 인터넷 게이트웨이의 태그 설정
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id # VPC ID를 라우트 테이블에 연결

  route {
    cidr_block = "0.0.0.0/0"                  # 모든 트래픽을 허용하는 CIDR 블록 설정
    gateway_id = aws_internet_gateway.main.id # 인터넷 게이트웨이를 라우트의 게이트웨이로 설정
  }
  tags = {
    Name = "my-route-table" # 라우트 테이블의 태그 설정
  }
}

// 생성
resource "aws_route_table" "main1" {
  vpc_id = aws_vpc.main.id # VPC ID 설정

  // NAT 인스턴스를 라우트의 네트워크 인터페이스로 설정 (추가 영상)
  route {
    cidr_block           = "0.0.0.0/0"                            # 모든 트래픽을 허용하는 CIDR 블록 설정
    network_interface_id = var.nat_interface_network_interface_id # 네트워크 인터페이스 ID 설정
  }

  tags = {
    Name = "my-route-table-nat" # 라우트 테이블의 태그 설정
  }
}