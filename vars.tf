variable "profile" {}
variable "region" {}
variable "instance_type" {
        type = "map"
}
variable "my_ami" {
        type = "map"
}
variable "name" {}
variable "key_name" {
        default = "S3FS"
}



