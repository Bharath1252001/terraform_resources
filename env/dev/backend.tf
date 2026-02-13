terraform {
  backend "s3" {
    bucket = "bharath-terraform-state-1252001"
    key    = "dev/ec2.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt = true
  }
}
