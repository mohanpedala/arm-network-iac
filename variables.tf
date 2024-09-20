variable "region" {
  description = "The AWS region"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "tags" {
    description = "tags"
    type = map(string)
}