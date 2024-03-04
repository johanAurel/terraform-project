variable "availability_zone" {
  type = list(string)
  default = [ "eu-west-2a",  "eu-west-2b", "eu-west-2c"]
}
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}