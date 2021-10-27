variable "ami_id" {
  type = string

  default = "ami-0f016ee9744d41846"
}

variable "region" {
   default = "ap-south-1"
}

provider "aws" {
 
  region   = "ap-south-1"
  access_key = "AKIAXPYYNAEMNBA76HOX"
  secret_key = "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"
  
}

resource "aws_instance" "evalInstance" {
   ami             = "ami-0f016ee9744d41846"
   //ami             = ${lookup(var.ami_id, var.region)}
   instance_type   = "t2.micro"
   security_groups = ["${aws_security_group.ports.name}"] 
}

resource "aws_ebs_volume" "storage" {
    availability_zone = "ap-south-1a"
	size              = 8 
}
 
resource "aws_security_group" "ports" {
	 description    = "Allow standard ports"
  ingress {
    from_port    = 80
    to_port      = 80
    protocol     = "tcp"
    cidr_blocks  =["0.0.0.0/0"]
  }
 ingress {
    from_port    = 22
    to_port      = 22
    protocol     = "tcp"
    cidr_blocks  =["0.0.0.0/0"]
  }
  egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  =["0.0.0.0/0"]
  }
  tags          = { "Terraform" : "true" }
}
 
/*output "public_ip" {
  value = "${aws_instance.Myinstance.public_ip}"
}*/




