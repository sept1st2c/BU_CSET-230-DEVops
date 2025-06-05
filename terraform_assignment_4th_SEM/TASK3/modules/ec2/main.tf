resource "aws_instance" "main" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  root_block_device {
    volume_size = var.volume_size
  }

  associate_public_ip_address = false

  tags = {
    Name = var.name
  }
}
