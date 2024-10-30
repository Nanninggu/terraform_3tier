variable "bucket_name" {
  description = "The name of the S3 bucket" # S3 버킷의 이름 설명
  type        = string                      # 변수 타입 설정 (문자열)
}

variable "acl" {
  description = "The ACL to apply to the bucket" # 버킷에 적용할 ACL 설명
  type        = string                           # 변수 타입 설정 (문자열)
  default     = "private"                        # 기본값 설정
}