
variable "key" {
  type = string
  default = "id"
}

variable "table" {
  type = list(string)
  default = [ "lighting-table", "heating-table" ]
}
