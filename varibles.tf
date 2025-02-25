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

