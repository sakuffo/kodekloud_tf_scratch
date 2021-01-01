variable "app_region" {
  type    = string
}


variable "bucket" {
  type    = string
  default = "flexit-payroll-alpha-22001c-saa"
}

variable "ami" {
  type    = string
  default = "ami-0885b1f6bd170450c"
}