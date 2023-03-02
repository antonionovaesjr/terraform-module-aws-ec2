provider "aws" {
  region  = "us-east-2"
  profile = "account-12345678910-lab"
}

module "ec2_instance" {
  source  = "git::https://github.com/antonionovaesjr/terraform-ec2-module-example.git?ref=9977afcce8fc858222d3287addf6345a98f5d07d"
  name               = "SERVER01"
  instance_os        = "ubuntu"
  instance_type      = "t3a.medium"
  key_name           = "demonstracao-aws"
  security_group_ids = ["sg-0030ec31e103d2104"]
  subnet_id          = "subnet-94706afc"
  volume_size        = 20
  user_data_file_path = "./user-data.sh"
  enviroment = "Dev"
}

resource "aws_s3_bucket" "bucket_example" {
  bucket = "my-123abc-example-bucket"
  tags = {
    Name        = "my-123abc-example-bucket"
    Environment = "Dev"
    Type        = "storage"
    Managed     = "IAC"
  }
}

# resource "aws_s3_bucket_versioning" "versioning_example" {
#   bucket = aws_s3_bucket.bucket_example.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }