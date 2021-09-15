resource "aws_instance" "ec2instance" {
   ami           = "${lookup(var.ami_id, var.region)}"
   instance_type = "t2.micro"
 }
