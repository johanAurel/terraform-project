variable "security_group_ids" {
  type = list(string)
}
variable "subnet_id" {
  type = list(string)
}
variable "key_name" {
  type = string
}
variable "instance_type" {
  type = string
}

variable "private_subnet" {
  type = string
}