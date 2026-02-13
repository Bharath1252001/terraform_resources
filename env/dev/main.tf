module "web" {
  source = "../../modules/ec2"

  name = "dev-web"

  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t3.micro"
  subnet_id     = "subnet-02933432f5e1f40cd"
  key_name      = "my-key"

  vpc_security_group_ids = ["sg-068556a41e2be7ecc"]

  user_data = file("../../modules/ec2/userdata.sh")

  tags = {
    Environment = "dev"
    Project     = "terraform-learning"
  }
}
