resource "aws_instance" "ec2" {
	ami = "${var.my_ami}"
	instance_type = "${var.instance_type}"
	tags {
		Name = "Test_Terraform_A"
	}
	key_name = "${var.key_name}"
}
