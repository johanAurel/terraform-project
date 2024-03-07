resource "aws_lb_target_group" "public_target_group" {
  name     = "public-lb-tg"
  port     = 3000
  protocol = "HTTP"
  protocol_version = "HTTP1"
  vpc_id   = var.vpc_id
 
  health_check {
    path = "/health-check"
    protocol = "HTTP"
  }
 
}

resource "aws_lb_target_group_attachment" "public" {
  target_group_arn = aws_lb_target_group.public_target_group.arn
  target_id        = var.public_instance_id
  port             = 3000
}

resource "aws_lb" "public-lb" {
  name               = "public-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.public_subnets_id
  }

resource "aws_lb_listener" "public-listener" {
  load_balancer_arn = aws_lb.public-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_target_group.arn
  }
}


resource "aws_lb_target_group" "private_target_group" {
  name     = "private-lb-tg"
  port     = 3000
  protocol = "HTTP"
  protocol_version = "HTTP1"
  vpc_id   = var.vpc_id
 
  health_check {
    path = "/health-check"
    protocol = "HTTP"
  }
 
}

resource "aws_lb_target_group_attachment" "private" {
  target_group_arn = aws_lb_target_group.private_target_group.arn
  target_id        = var.private_instance_id
  port             = 3000
}

resource "aws_lb" "private-lb" {
  name               = "private-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.private_subnets_id
  }

resource "aws_lb_listener" "private-listener" {
  load_balancer_arn = aws_lb.private-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private_target_group.arn
  }
}