variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "path_pub_key" {
  type = string
}

variable "vpc_id" {
  type = string
}