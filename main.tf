# How can we use terraform to dynamically deploy a VPC with 1 subnet in each availability zone.
# •Region value and VPC CIDR block will be given as input.
# •Terraform should dynamically provision a subnet for each availability Zone.


# •Example 1 – N California – us-west-1 – 2 availability zonesVPC CIDR – 10.0.0.0/16Subnet CIDRs – [ 10.0.0.0/17, 10.0.128.0/17 ]

# •Example 2 – Oregon – us-west-2 – 4 availability zonesVPC CIDR – 10.0.0.0/16Subnet CIDRs – [ 10.0.0.0/18, 10.0.64.0/18, 10.0.128.0/18, 10.0.192.0/18 ]


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