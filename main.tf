provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAXPYYNAEMNBA76HOX"
  secret_key = "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"
}

resource "aws_instance" "Myinstance" {
   ami           = "${lookup(var.ami_id, var.region)}"
   instance_type = "t2.micro"
 }
