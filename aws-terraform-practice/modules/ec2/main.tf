resource "aws_instance" "name" {
  ami = var.instance_ami
  instance_type = var.instance_type
  tags = var.tags
}