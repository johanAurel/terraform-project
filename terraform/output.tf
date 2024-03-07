output "instances" {
  value = [module.instance.auth_id, module.instance.heating_id, module.instance.lighting_id, module.instance.status_id]
}
output "security_group_ids" {
  value = module.security.security_group_ids
}
output "public_subnets"{
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}