resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  vpc_security_group_ids = var.vpc_security_group_ids

  user_data = var.user_data

  metadata_options {
    http_tokens = "required"   # Enforce IMDSv2 (Security best practice)
  }

  root_block_device {
    encrypted = true
    volume_size = 20
    volume_type = "gp3"
  }

  tags = merge(
    {
      Name = var.name
      ManagedBy = "Terraform"
    },
    var.tags
  )
}
