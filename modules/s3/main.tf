resource "aws_s3_bucket" "this" { # 리소스 "aws_s3_bucket" 정의
  bucket = var.bucket_name        # 버킷 이름을 변수 "bucket_name"으로 설정
}