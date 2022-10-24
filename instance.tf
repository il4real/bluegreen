resource "aws_instance" "blue" {
  ami                    = data.aws_ami.ubuntu_latest
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.bg-subnet-pub-1.id
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
  user_data              = file("nginxB.sh")
}

resource "aws_lb_target_group" "blue" {
  name     = "blue-tg-lb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.bluegreen.id

  health_check {
    port     = 80
    protocol = "HTTP"
    timeout  = 5
    interval = 10
  }
}

resource "aws_lb_target_group_attachment" "blue" {
  count            = length(aws_instance.blue)
  target_group_arn = aws_lb_target_group.blue.arn
  target_id        = aws_instance.blue.id
  port             = 80
}


resource "aws_instance" "green" {
  ami                    = data.aws_ami.ubuntu_latest
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.bg-subnet-pub-1.id
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
  user_data              = file("nginxG.sh")
}

resource "aws_lb_target_group" "green" {
  name     = "green-tg-lb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.bluegreen.id

  health_check {
    port     = 80
    protocol = "HTTP"
    timeout  = 5
    interval = 10
  }
}

resource "aws_lb_target_group_attachment" "green" {
  count            = length(aws_instance.green)
  target_group_arn = aws_lb_target_group.green.arn
  target_id        = aws_instance.green.id
  port             = 80
}
