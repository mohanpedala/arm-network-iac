# Create a VPC
data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = merge(local.default_tags, var.tags)
}

resource "aws_subnet" "subnet" {
  count = length(data.aws_availability_zones.available.names)
  vpc_id     = aws_vpc.main.id
  # using the cidrsubnet to dynamically generate the CIDR for the subnet
  cidr_block = cidrsubnet(var.vpc_cidr_block, 4, count.index)

  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = merge(local.default_tags, var.tags, {
    Name = "subnet-${count.index + 1}"
  })
}