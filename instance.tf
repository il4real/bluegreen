resource "aws_instance" "blue" {
    ami = "${var.AMI}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.bg-subnet-pub-1.id}"
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
    user_data = "${file("nginx.sh")}"
}

output "security_check" {
    description = "check_sg"
    value = aws_security_group.ssh-allowed.id
}