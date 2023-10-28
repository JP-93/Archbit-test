variable "vpc_id" {
    type = string
}

variable "key_pair_name"{
    type = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}