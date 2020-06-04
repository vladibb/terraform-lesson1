variable "ec2_name" {
  type        = "string"
  description = "Name of the EC2 host"
}

variable "ec2_type" {
  type        = "string"
  description = "EC2 instance type to construct"
}

variable "keypair" {
  type        = "string"
  description = "EC2 keypair name"
}

variable "ami_id" {
  type        = "string"
  description = "ID of the AMI to construct"
}

variable "subnet_id" {
  type        = "string"
  description = "ID of the Public Subnet for EC2"
}

variable "main_sg_id" {
  type        = "list"
  description = "Main security group ID"
}
