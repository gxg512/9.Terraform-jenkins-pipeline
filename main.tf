
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-43143141343"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
