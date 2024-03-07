variable "ami_id" {
  type = list(string)
  description = "for list of public amis"
}

variable "security_group_ids" {
  type = list(string)
}

variable "public_ami" {
  default = ["lighting", "heating", "status"]
}

variable "public_subnets_id" {
  type = list(string)
}

variable "private_subnets_id" {
  type = list(string)
}

variable "private_ami_id" {
  type = string
}