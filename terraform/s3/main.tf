terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}


resource "aws_kms_key" "kms_s3_key" {
  description             = "Key to protect S3 objects"
  key_usage               = "ENCRYPT_DECRYPT"
  deletion_window_in_days = 7
  is_enabled              = true
}

resource "aws_kms_alias" "kms_s3_key_alias" {
  name          = "alias/s3-key"
  target_key_id = aws_kms_key.kms_s3_key.key_id
}

resource "aws_s3_bucket" "archbit-s3" {
  bucket = "archbit-s3"

  tags = {
    name        = "Archbit-s3"
    Environment = "Dev"
  }

}