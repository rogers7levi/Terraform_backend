resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "website" {
  bucket = "my-website-${random_string.bucket_suffix.result}"

  website {
    index_document = "index.html"
    
  }
}

resource "aws_s3_bucket_public_access_block" "block-rules" {
   bucket = "my-website-${random_string.bucket_suffix.result}"

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_object" "entry-point" {
   bucket = "my-website-${random_string.bucket_suffix.result}"
  key    = "index.html"
  source = "./index.html"
}





