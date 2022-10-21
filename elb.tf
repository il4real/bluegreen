module "elb_http" {
  source  = "terraform-aws-modules/elb/aws"
  version = "~> 2.0"

  name = "elb-bg"

  subnets         = [aws_subnet.bg-subnet-pub-1.id]
  security_groups = [aws_security_group.ssh-allowed.id]
  internal        = false

  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    }
    # {
    #   instance_port     = 8080
    #   instance_protocol = "http"
    #   lb_port           = 8080
    #   lb_protocol       = "http"
    #   ssl_certificate_id = "arn:aws:acm:eu-west-1:235367859451:certificate/6c270328-2cd5-4b2d-8dfd-ae8d0004ad31"
    # },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  #   access_logs = {
  #     bucket = "my-access-logs-bucket"
  #   }

  // ELB attachments
  number_of_instances = 2
  instances           = [for i in aws_instance.blue: i.id]
  depends_on          = [aws_instance.blue]

  tags = {
    Name = "BlueGreen LB"
  }
}
