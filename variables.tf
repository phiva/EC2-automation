variable "ami_id" {
  description = "AMI ID"
  default     = "ami-0f9de6e2d2f067fca" # Amazon Linux 2 (exemplo)
}

variable "instance_type" {
  description = "Tipo da instância"
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID para a instância EC2"
}
