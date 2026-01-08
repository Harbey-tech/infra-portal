# Configure AWS provider
provider "aws" {
  region = var.region
}

# Generate random suffix for S3 bucket to ensure global uniqueness
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# S3 bucket with random suffix
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.project_name}-bucket-${random_id.bucket_suffix.hex}"
  tags = {
    Name = var.project_name
  }
}

# EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2 (us-east-1)
  instance_type = var.instance_type

  tags = {
    Name = var.project_name
  }
}

