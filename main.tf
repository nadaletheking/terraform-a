terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "il-central-1"
}

provider "tls" {

}


# do not use this in production,
# the private key is saves as plain text in the terraform state file
resource "tls_private_key" "tls_pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.tls_pk.public_key_openssh
}

resource "aws_instance" "app_server" {
  ami             = "ami-00e448b3f42f8156f"
  instance_type   = "t3.micro"
  key_name        = aws_key_pair.generated_key.key_name
  security_groups = [aws_security_group.ec2_security_group.name]

  tags = {
    Name = var.instance_name
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y nginx",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]


    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.tls_pk.private_key_pem
      host        = aws_instance.app_server.public_ip
    }
  }

}

resource "local_sensitive_file" "pem_file" {
  filename             = "${path.module}/output-files/pk.pem"
  file_permission      = "600"
  directory_permission = "700"
  content              = tls_private_key.tls_pk.private_key_pem
}