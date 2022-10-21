variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "AMI" {
  default = "ami-072b7a2ffac6318c1"
}

variable "rules" {

  type = list(object({
    port        = number
    proto       = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      port        = 80
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 22
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
