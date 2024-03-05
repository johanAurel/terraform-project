output "instance_id" {
  value = [aws_instance.lighting.id, aws_instance.heating.id, aws_instance.status.id, aws_instance.auth.id]
}

output "lighting_id" {
  value = aws_instance.lighting.id
}
output "heating_id" {
  value = aws_instance.heating.id
}
output "status_id" {
  value = aws_instance.status.id
}
output "auth_id" {
  value = aws_instance.auth.id
}