resource "aws_instance" "ec2" {
   ami           = "${lookup(var.ami_id, var.region)}"
   instance_type = "t2.micro"
 }
