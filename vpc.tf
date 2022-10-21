resource "aws_vpc" "bluegreen" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  

  tags = {
    Name = "bluegreen"
  }
}

resource "aws_subnet" "bg-subnet-pub-1" {
  vpc_id                  = aws_vpc.bluegreen.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "bg-subnet-pub-1"
  }
}
