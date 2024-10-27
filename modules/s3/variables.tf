variable "bucket_name" {
    description = "The name of the S3 bucket"
    type        = string
}

variable "acl" {
    description = "The ACL to apply to the bucket"
    type        = string
    default     = "private"
}