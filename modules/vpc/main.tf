resource "aws_vpc" "johans-vpc" {
  cidr_block = "10.0.0.0/20"
}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnets)  
  vpc_id     = aws_vpc.johans-vpc.id 
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.availability_zone[count.index]
  tags = {
    Name = "public${count.index}"
  }
  
}

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnets)
  vpc_id     = aws_vpc.johans-vpc.id 
  cidr_block = var.private_subnets[count.index]
  availability_zone = var.availability_zone[count.index]
   tags = {
    Name = "private${count.index}"
  }
  
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.johans-vpc.id
}
resource "aws_eip" "nat" {
  domain = "vpc"
}
resource "aws_nat_gateway" "NAT" {
  subnet_id     = aws_subnet.public_subnets[1].id
  allocation_id = aws_eip.nat.id
  tags = {
    Name      = "NAT "
  }
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.johans-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
resource "aws_route_table_association" "public_routes" {
  count          = length(aws_subnet.public_subnets[*])
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_subnets[count.index].id
}