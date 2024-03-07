resource "aws_launch_template" "sample_console_public" {
  count = length(var.public_ami)
  name = "sample-console${var.public_ami[count.index]}"
  image_id = var.ami_id[count.index]
  key_name = "firstProjectKeyPair"

  instance_initiated_shutdown_behavior = "stop"


  instance_type = "t2.micro"

  network_interfaces {
    associate_public_ip_address = true
    security_groups = var.security_group_ids
  }
  placement {
    availability_zone = "eu-west-2a"
  }
  tag_specifications {
   resource_type = "instance"

    tags = {
      Name = "sample-console${var.public_ami[count.index]}"
    }
  }

}

resource "aws_autoscaling_group" "rescheduled-public" {
  count = 3
  name                      = "scheduling-public${count.index}"
  max_size                  = 5
  min_size                  = 1
  desired_capacity          = 2
  vpc_zone_identifier = var.public_subnets_id
  launch_template {
    id = aws_launch_template.sample_console_public[count.index].id
    version = "$Latest"
  }
}

resource "aws_launch_template" "sample_console_private" {
  name = "sample-console-auth"
  image_id = var.private_ami_id
  key_name = "firstProjectKeyPair"

  instance_initiated_shutdown_behavior = "stop"


  instance_type = "t2.micro"

  network_interfaces {
    associate_public_ip_address = false
    security_groups = var.security_group_ids
  }
  placement {
    availability_zone = "eu-west-2a"
  }
  tag_specifications {
   resource_type = "instance"

    tags = {
      Name = "sample-console-private"
    }
  }

}

resource "aws_autoscaling_group" "rescheduled-private" {
  name                      = "scheduling-private"
  max_size                  = 5
  min_size                  = 1
  desired_capacity          = 2
  vpc_zone_identifier = var.private_subnets_id
  launch_template {
    id = aws_launch_template.sample_console_private.id
    version = "$Latest"
  }
}