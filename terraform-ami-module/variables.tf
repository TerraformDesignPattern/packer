variable "aws_region" {}

variable "image_ids" {
  default = {
    eu-west-1 = ""
    us-east-1 = "ami-20bf3737"
    us-west-1 = ""
    us-west-2 = ""
  }
}
