resource "aws_subnet" "bg-subnet-pub-1" {
  vpc_id                  = aws_vpc.bluegreen.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "bg-subnet-pub-1"
  }
}

resource "aws_subnet" "bg-subnet-pub-2" {
  vpc_id                  = aws_vpc.bluegreen.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1b"

  tags = {
    Name = "bg-subnet-pub-2"
  }
}
