output "lighting_machine_id" {
  value = aws_ami_from_instance.lighting-machine-image.id
}

output "heating_machine_id" {
  value = aws_ami_from_instance.heating-machine-image.id
}

output "status_machine_id" {
  value = aws_ami_from_instance.status-machine-image.id
}

output "auth_machine_id" {
  value = aws_ami_from_instance.auth-machine-image.id
}

output "public_ami_id" {
  value = [aws_ami_from_instance.lighting-machine-image.id, aws_ami_from_instance.heating-machine-image.id, aws_ami_from_instance.status-machine-image.id
  ]
}