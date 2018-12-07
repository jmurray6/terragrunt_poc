variable "region" {}
variable "profile" {}
variable "instance_type" {}
variable "my_ami" {
	type = "map"
}
variable "key_name"  {}
variable "name" {}

provider "aws" {
	region = "${var.region}"
	shared_credentials_file = "/home/ec2-user/.aws/credentials"
	profile = "terraform"
}

data "terraform_remote_state""aws_global" {
  	backend = "s3"
	config {
    		region = "us-east-1"
    		bucket = "axiodevelopmentbucket"
    		key = "state_loc/terraform/env/${var.name}/terraform.tfstate"
    		profile = "${var.profile}"
  }
}

resource "aws_instance"
"web" {
	ami = "${lookup(var.my_ami, var.region)}"
	instance_type = "${var.instance_type}"
	tags {
		Name = "Test_Terraform_A"
	}
	key_name = "${var.key_name}"
}
