variable "vpc_id" {
  description = "The VPC ID where the ALB will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs where the ALB will be deployed"
  type = list(string)
}

variable "security_group_ids" {
  description = "The security group IDs to associate with the ALB"
  type = list(string)
}

variable "target_instance_ids" {
  description = "The instance IDs to register with the target group"
  type = list(string)
}
