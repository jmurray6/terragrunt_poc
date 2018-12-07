variable "region" {}
variable "profile" {}
variable "instance_type" {}
variable "my_ami" {
	type = "map"
}
variable "key_name"  {}

provider "aws" {
	region = "${var.region}"
	shared_credentials_file = "/home/ec2-user/.aws/credentials"
	profile = "terraform"
}

resource "aws_instance"
"web" {
	ami = "${lookup(var.my_ami, var.region)}"
	instance_type = "t1.micro"
	tags {
		Name = "Test_Terraform_A"
	}
	key_name = "${var.key_name}"
}
