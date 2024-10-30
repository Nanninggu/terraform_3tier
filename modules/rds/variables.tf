variable "db_name" {
  description = "The name of the database" # 데이터베이스 이름 설명
  type        = string                     # 변수 타입 설정 (문자열)
}

variable "username" {
  description = "The username for the database" # 데이터베이스 사용자 이름 설명
  type        = string                          # 변수 타입 설정 (문자열)
}

variable "password" {
  description = "The password for the database" # 데이터베이스 비밀번호 설명
  type        = string                          # 변수 타입 설정 (문자열)
  sensitive   = true                            # 민감한 정보로 설정
}

variable "instance_class" {
  description = "The instance class for the RDS instance" # RDS 인스턴스 클래스 설명
  type        = string                                    # 변수 타입 설정 (문자열)
  default     = "db.t3.micro"                             # 기본값 설정
}

variable "allocated_storage" {
  description = "The allocated storage for the RDS instance" # RDS 인스턴스에 할당된 스토리지 설명
  type        = number                                       # 변수 타입 설정 (숫자)
  default     = 20                                           # 기본값 설정
}

variable "vpc_security_group_ids" {
  description = "The VPC security group IDs to associate with the RDS instance" # RDS 인스턴스에 연결할 VPC 보안 그룹 ID 설명
  type        = list(string)                                                    # 변수 타입 설정 (문자열 리스트)
}

variable "subnet_ids" {
  description = "The subnet IDs to associate with the RDS instance" # RDS 인스턴스에 연결할 서브넷 ID 설명
  type        = list(string)                                        # 변수 타입 설정 (문자열 리스트)
}