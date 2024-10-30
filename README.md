# 프로젝트 개요

이 프로젝트는 Terraform을 사용하여 AWS 인프라를 구성하는 예제입니다. 주요 모듈로는 VPC, 서브넷, 보안 그룹, EC2, S3, RDS, ALB 등이 포함되어 있습니다.

## 모듈 설명

### VPC 모듈
- **경로**: `./modules/vpc`
- **설명**: VPC를 생성하고 관리합니다.

### 서브넷 모듈
- **경로**: `./modules/subnet`
- **설명**: 퍼블릭 및 프라이빗 서브넷을 생성합니다.

### 보안 그룹 모듈
- **경로**: `./modules/security-group`
- **설명**: 보안 그룹을 생성하고 관리합니다.

### EC2 모듈
- **경로**: `./modules/ec2`
- **설명**: EC2 인스턴스를 생성하고 관리합니다.

### S3 모듈
- **경로**: `./modules/s3`
- **설명**: S3 버킷을 생성하고 관리합니다.

### RDS 모듈
- **경로**: `./modules/rds`
- **설명**: RDS 인스턴스를 생성하고 관리합니다.

### ALB 모듈
- **경로**: `./modules/alb`
- **설명**: 애플리케이션 로드 밸런서를 생성하고 관리합니다.

## 주요 변수

### `main.tf`
- **provider "aws"**: AWS 리전을 `ap-northeast-2`로 설정합니다.
- **module "vpc"**: VPC 모듈을 설정합니다.
- **module "subnet"**: 서브넷 모듈을 설정합니다.
- **module "security-group"**: 보안 그룹 모듈을 설정합니다.
- **module "key_pair"**: 키 페어 모듈을 설정합니다.
- **module "ec2"**: EC2 모듈을 설정합니다.
- **module "s3"**: S3 모듈을 설정합니다.
- **module "rds"**: RDS 모듈을 설정합니다.
- **module "alb"**: ALB 모듈을 설정합니다.

### `variables.tf`
- **variable "nat_interface_network_interface_id"**: NAT 인스턴스의 네트워크 인터페이스 ID를 정의합니다.

## 보안 그룹 설정

### `aws_security_group "allow_ssh"`
- **설명**: SSH 인바운드 트래픽을 허용하는 보안 그룹을 생성합니다.
- **ingress**: 22번 포트와 모든 포트를 허용합니다.
- **egress**: 모든 포트를 허용합니다.
- **tags**: 보안 그룹에 `Name` 태그를 설정합니다.