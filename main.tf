
provider "aws" {
	region = "${var.region}"
	shared_credentials_file = "/home/ec2-user/.aws/credentials"
	profile = "terraform"
}

terraform {
   backend "s3" {
	region = "us-east-1"
        bucket = "axiodevelopmentbucket"
        key = "state_loc/terraform/env/test2/terraform.tfstate"
        profile = "terraform"
}
}

data "terraform_remote_state""aws_global" {
  	backend = "s3"
	config {
    		region = "us-east-1"
    		bucket = "axiodevelopmentbucket"
    		key = "state_loc/terraform/env/test2/terraform.tfstate"
    		profile = "${var.profile}"
  }
}

module "ec2" {
   source = "./modules/ec2"
   	region = "${var.region}"
   	my_ami = "${lookup(var.my_ami, var.region)}"
   	instance_type = "${lookup(var.instance_type, var.region)}"
   	key_name = "${var.key_name}"
}

