output "bucket_arn" {            # 출력 변수 "bucket_arn" 정의
  value = aws_s3_bucket.this.arn # 출력 값으로 S3 버킷의 ARN 설정
}

output "bucket_name" {              # 출력 변수 "bucket_name" 정의
  value = aws_s3_bucket.this.bucket # 출력 값으로 S3 버킷의 이름 설정
}