provider "aws" {
  region = "ap-south-1"  # Change if needed
}

resource "aws_instance" "portfolio" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 (Mumbai)
  instance_type = "t2.micro"
  key_name      = var.key_name

  tags = {
    Name = "portfolio-server"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory"
  }
}
