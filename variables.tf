variable "aws_profile" {
  default = "aay"
}
variable "aws_region" {
  default = "us-east-1"
}

variable "reg" {
  type = "map"
  default = {
    us-east-1 = "usea1"
    us-west-2 = "uswe2"
  }
}
