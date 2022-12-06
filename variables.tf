variable "name" {}

variable "rg" {}

variable "vnets" {
  type = map(object({
    name = string
    id   = string
  }))
}
