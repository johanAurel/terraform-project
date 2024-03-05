
variable "key" {
  type = list(string)
  default = [ "id", "id" ]
}

variable "table" {
  type = list(string)
  default = [ "lighting-table", "heating-table" ]
}
