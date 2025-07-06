provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "portfolio" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 22.04 LTS for ap-south-1
  instance_type = "t2.micro"
  key_name      = "portfolio-key"         # This must match your AWS key pair name

  tags = {
    Name = "PortfolioInstance"
  }
}

output "public_ip" {
  value = aws_instance.portfolio.public_ip
}
