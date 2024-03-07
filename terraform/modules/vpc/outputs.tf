output "public_subnet_id" {
    value = aws_subnet.public_subnets[*].id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnets[*].id
}

output "vpc_id" {
  value = aws_vpc.johans-vpc.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}

