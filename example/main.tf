provider "aws" {
  region  = "us-east-2"
  profile = "account-12345678910-lab"
}

module "ec2_instance" {
  source              = "git::https://github.com/antonionovaesjr/terraform-module-aws-ec2.git?ref=master"
  name                = "SERVER01"
  instance_os         = "ubuntu"
  instance_type       = "t3a.medium"
  key_name            = "demonstracao-aws"
  security_group_ids  = ["sg-0030ec31e103d2104"]
  subnet_id           = "subnet-94706afc"
  volume_size         = 20
  user_data_file_path = "./user-data.sh"
  enviroment          = "Dev"
}


resource "random_string" "random_id" {
  length      = 16
  upper       = false
  special     = false
  min_numeric = 6
}

resource "aws_s3_bucket" "bucket_example" {
  bucket = "my-example-bucket-${random_string.random_id.result}"
  tags = {
    Name        = "my-123abc-example-bucket"
    Environment = "Dev"
    Type        = "storage"
    Managed     = "IAC"
    BuceketId   = random_string.random_id.result
  }
}

# resource "aws_s3_bucket_versioning" "versioning_example" {
#   bucket = aws_s3_bucket.bucket_example.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }