output "public_lb_id" {
  value = aws_lb.public-lb.id
}

output "private_lb_id" {
  value = aws_lb.private-lb.id
}