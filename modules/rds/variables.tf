variable "db_name" {
    description = "The name of the database"
    type        = string
}

variable "username" {
    description = "The username for the database"
    type        = string
}

variable "password" {
    description = "The password for the database"
    type        = string
    sensitive   = true
}

variable "instance_class" {
    description = "The instance class for the RDS instance"
    type        = string
    default     = "db.t3.micro"
}

variable "allocated_storage" {
    description = "The allocated storage for the RDS instance"
    type        = number
    default     = 20
}

variable "vpc_security_group_ids" {
    description = "The VPC security group IDs to associate with the RDS instance"
    type        = list(string)
}

variable "subnet_ids" {
    description = "The subnet IDs to associate with the RDS instance"
    type        = list(string)
}