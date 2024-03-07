output "public_autoscaler_id" {
  value = aws_autoscaling_group.rescheduled-public[*].id
}

output "private_autoscaler_id" {
  value = aws_autoscaling_group.rescheduled-private.id
}

output "public_launch_template_id" {
  value = [aws_launch_template.sample_console_public[*].id]
}

output "private_launch_template_id" {
  value = aws_launch_template.sample_console_private.id
}