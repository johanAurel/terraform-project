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
  instance_type = "t2.micro"
 security_groups = var.security_group_ids
 subnet_id =  element(var.subnet_id, 0)
  tags = {
    Name = "lighting"
  }
}
resource "aws_instance" "heating" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
 security_groups = var.security_group_ids
 subnet_id = element(var.subnet_id, 1)
  tags = {
    Name = "heating"
  }
}
resource "aws_instance" "status" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
 security_groups = var.security_group_ids
 subnet_id = element(var.subnet_id, 2)
  tags = {
    Name = "status"
  }
}
resource "aws_instance" "auth" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
 security_groups = var.security_group_ids
 subnet_id =  element(var.subnet_id, 0)
  tags = {
    Name = "auth"
  }
}