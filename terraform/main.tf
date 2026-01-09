locals {
  config = yamldecode(file("${path.module}/config/app.yaml"))
}

provider "aws" {
  region = local.config.region
}

# Random suffix for S3 bucket
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# S3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "${local.config.project_name}-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name = local.config.project_name
  }
}

# EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
  instance_type = local.config.instance_type

  tags = {
    Name = local.config.project_name
  }
}
