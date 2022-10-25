resource "aws_key_pair" "bluegreen" {
  key_name   = "bluegreen"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "bluegreen" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "bluegreen"
}