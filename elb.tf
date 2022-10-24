resource "aws_lb" "bluegreenlb" {
  name               = "bluegreenlb"
  internal           = false
  subnets             = [ aws_subnet.bg-subnet-pub-1.id, aws_subnet.bg-subnet-pub-2.id ]
  security_groups    = [ aws_security_group.ssh-allowed.id ]
  depends_on          = [aws_instance.blue, aws_instance.green]
}

resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_lb.bluegreenlb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = aws_lb_target_group.blue.arn
        weight = lookup(local.traffic_dist_map[var.traffic_distribution], "blue", 100)
      }

      target_group {
        arn    = aws_lb_target_group.green.arn
        weight = lookup(local.traffic_dist_map[var.traffic_distribution], "green", 0)
      }

      stickiness {
        enabled  = false
        duration = 1
      }
    }
  }
}


