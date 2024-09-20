output "subnet_cidrs" {
  value = aws_subnet.subnet[*].cidr_block
}