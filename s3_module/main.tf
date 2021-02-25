
#tfsec:ignore:AWS002
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"

   versioning {
    enabled = var.versioning_enable
  }

server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }

  tags = {
    Name        = var.s3_bucket_name
    Environment = var.environment
    Project = var.project
  }
}

