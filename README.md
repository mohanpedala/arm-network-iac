# How can we use terraform to dynamically deploy a VPC with 1 subnet in each availability zone.

- Region value and VPC CIDR block will be given as input.
- Terraform should dynamically provision a subnet for each availability Zone.
  - Example 1 – N California – us-west-1 – 2 availability zonesVPC CIDR – 10.0.0.0/16Subnet CIDRs – [ 10.0.0.0/17, 10.0.128.0/17 ]
  - Example 2 – Oregon – us-west-2 – 4 availability zonesVPC CIDR – 10.0.0.0/16Subnet CIDRs – [ 10.0.0.0/18, 10.0.64.0/18, 10.0.128.0/18, 10.0.192.0/18 ]
