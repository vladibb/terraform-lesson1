resource "aws_instance" "vladi-devops-level3" {
  ami             = var.ami_id
  instance_type   = var.ec2_type
  subnet_id       = var.subnet_id
  key_name        = var.keypair

  user_data = file("aws-devops-level3.userdata.sh")
  iam_instance_profile = "vladi-sandbox-ssm"

  vpc_security_group_ids = var.main_sg_id

  tags = {
    Name = var.ec2_name
  }
}
