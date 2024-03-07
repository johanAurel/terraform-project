variable "public" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "availability_zone" {
  type = list(string)
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
}