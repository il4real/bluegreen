output "elb_dns" {
  description = "DNS name of Load Balancer"
  value = "${aws_lb.bluegreenlb.dns_name}"
}