variable "vpc_id" {
  type = string
}

variable "public_instance_id" {
  type = string
}

variable "private_instance_id" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "public_subnets_id" {
  type = list(string)
}

variable "private_subnets_id" {
  type = list(string)
}



