provider "aws" {
 region = "eu-west-2"  

}
resource "aws_ami_from_instance" "lighting-machine-image" {
  name               = "lighting-machine-image"
  source_instance_id = var.lighting_id
}

resource "aws_ami_from_instance" "heating-machine-image" {
  name               = "heating-machine-image"
  source_instance_id = var.heating_id
}

resource "aws_ami_from_instance" "status-machine-image" {
  name               = "status-machine-image"
  source_instance_id = var.status_id
}

resource "aws_ami_from_instance" "auth-machine-image" {
  name               = "auth-machine-image"
  source_instance_id = var.auth_id
}

