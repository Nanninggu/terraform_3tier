variable "vpc_id" {
  description = "The VPC ID where the ALB will be deployed" # ALB가 배포될 VPC ID 설명
  type        = string                                      # 변수 타입 설정 (문자열)
}

variable "subnet_ids" {
  description = "The subnet IDs where the ALB will be deployed" # ALB가 배포될 서브넷 ID 설명
  type        = list(string)                                    # 변수 타입 설정 (문자열 리스트)
}

variable "security_group_ids" {
  description = "The security group IDs to associate with the ALB" # ALB에 연결할 보안 그룹 ID 설명
  type        = list(string)                                       # 변수 타입 설정 (문자열 리스트)
}

variable "target_instance_ids" {
  description = "The instance IDs to register with the target group" # 타겟 그룹에 등록할 인스턴스 ID 설명
  type        = list(string)                                         # 변수 타입 설정 (문자열 리스트)
}