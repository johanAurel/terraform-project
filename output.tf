output "instances" {
  value = [module.instance.auth_id, module.instance.heating_id, module.instance.lighting_id, module.instance.status_id]
}