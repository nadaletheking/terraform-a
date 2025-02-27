variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "key_name" {
  description = "The rsa key name"
  type        = string
  default     = "my-ec2-key"
}


variable "aws_region" {
  description = "aws region"
  type        = string
  default     = "il-central-1"
}


variable "ami_filters" {
  description = "AMI filters"
  type = object({
    owner          = string
    name           = string
    architecture   = string
    virtualization = string
  })
  default = {
    owner          = "amazon"
    name           = "ubuntu/images/hvm-ssd/ubuntu-*"
    architecture   = "x86_64"
    virtualization = "hvm"
  }
}

variable "ec2_instance_type" {
  description = "The aws ec2 instance type"
  type        = string
  default     = "t3.micro"
}



variable "pk_local_sensetive_file" {
  description = "A local copy of the pk for the ssh connection"
  type = object({
    filename             = string
    file_permission      = string
    directory_permission = string
  })
  default = {
    filename             = "output-files/pk.pem"
    file_permission      = "600"
    directory_permission = "700"
  }
}

variable "s3_state" {
  description = "The s3 backend configuration"
  type = object({
    bucket = string
    key    = string
  })
  default = {
    bucket = "nadale-terraform-state-bucket"
    key    = "terraform-test/terraform.tfstate"
  }
}





