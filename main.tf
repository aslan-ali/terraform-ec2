provider "aws" {
  region = "eu-central-1"
}


resource "aws_instance" "ec2" {
  ami           = "ami-0dc7fe3dd38437495"
  instance_type = lookup(var.instance_type, terraform.workspace)
}


variable "instance_type" {
  type = map(string)

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "t2.large"
  }
}
