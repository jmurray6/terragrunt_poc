provider "aws" {
	region = "us-east-1"
	shared_credentials_file = "/home/ec2-user/.aws/credentials"
	profile = "terraform"
}

resource "aws_instance"
"web" {
	ami = "ami-009d6802948d06e52"
	instance_type = "t1.micro"
	tags {
		Name = "Test_Terraform_A"
}
}
