terraform {
  backend "s3" {
    bucket = ""
    key    = ""
    region = ""
  }

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
  region = var.aws_region

  default_tags {
    tags = var.default_tags
  }

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

resource "aws_eip" "elastic_ip" {
  instance = aws_instance.app_server.id
}


data "aws_ami" "latest_ubuntu" {
  most_recent = true
  owners      = [var.ami_filters.owner]

  filter {
    name   = "name"
    values = [var.ami_filters.name]
  }

  filter {
    name   = "architecture"
    values = [var.ami_filters.architecture]
  }

  filter {
    name   = "virtualization-type"
    values = [var.ami_filters.virtualization]
  }
}


resource "aws_instance" "app_server" {
  ami             = data.aws_ami.latest_ubuntu.id
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
  filename             = "${path.module}/${var.pk_local_sensetive_file.filename}"
  file_permission      = var.pk_local_sensetive_file.file_permission
  directory_permission = var.pk_local_sensetive_file.directory_permission
  content              = tls_private_key.tls_pk.private_key_pem
}