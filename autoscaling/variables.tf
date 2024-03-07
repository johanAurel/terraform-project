variable "ami_id" {
  type = list(string)
  description = "for list of public amis"
  default = [
  "ami-0cb839740fe20b99f",
  "ami-01575830a2dc6381e",
  "ami-0ec06f4218478ac26"
]
}

variable "security_group_ids" {
  type = list(string)
  default = [
  "sg-006d9888b48db47e1",
  "sg-01d98ab10e7cbc339",
  "sg-01184cb311fed1a25",
  "sg-02095fee53eb1c05f"
]
}

variable "public_ami" {
  default = ["lighting", "heating", "status"]
}

variable "public_subnets_id" {
  type = list(string)
  default = [
  "subnet-0cdba457fd234061e",
  "subnet-0fc749c5318fa77ce",
  "subnet-08b8eee102f3ceb8f"
]
}

variable "private_subnets_id" {
  type = list(string)
  default = [
  "subnet-0a233e508f32e90cc",
  "subnet-07079d71af553a85b",
  "subnet-02a3522149e39f6c2"
]
}

variable "private_ami_id" {
  type = string
  default = "ami-0b3a8f146ad105954"
}