data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
// lighting, heating , status
resource "aws_instance" "lighting" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_ids =  var.security_group_ids
 subnet_id =  element(var.subnet_id, 0)
 key_name = var.key_name
  tags = {
    Name = "lighting"
  }
}
resource "aws_instance" "heating" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
 security_groups = var.security_group_ids
 subnet_id = element(var.subnet_id, 1)
 key_name = var.key_name
  tags = {
    Name = "heating"
  }
}
resource "aws_instance" "status" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
 security_groups = var.security_group_ids
 subnet_id = element(var.subnet_id, 2)
 key_name = var.key_name
  tags = {
    Name = "status"
  }
}
resource "aws_instance" "auth" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
 security_groups = var.security_group_ids
 subnet_id = var.private_subnet
 key_name = var.key_name
  tags = {
    Name = "auth"
  }
}

