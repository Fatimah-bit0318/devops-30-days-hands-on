/*
==========================================
Day 13 - EC2 & Security Group
==========================================

Goal

Create

✔ Security Group

✔ EC2 Instance

using Terraform.
*/

##################################################
# Provider Configuration
##################################################

/*
Provider

Purpose

Connects Terraform to AWS.

Without a Provider,

Terraform doesn't know

where to create resources.
*/

provider "aws" {

  region = var.region

}

##################################################
# Variables
##################################################

/*
Variables

Purpose

Avoid hardcoding values.

Makes code reusable.
*/

variable "region" {

  default = "ap-south-1"

}

variable "instance_type" {

  default = "t2.micro"

}

variable "ami" {

  description = "Ubuntu AMI"

  default = "ami-xxxxxxxx"

}

##################################################
# Security Group
##################################################

/*
Security Group

Purpose

Acts as a firewall.

Allows only required traffic.
*/

resource "aws_security_group" "web_sg" {

  name = "Terraform-Web-SG"

  description = "Allow SSH and HTTP"

##################################################
# Ingress Rule - SSH
##################################################

  ingress {

    description = "Allow SSH"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

##################################################
# Ingress Rule - HTTP
##################################################

  ingress {

    description = "Allow HTTP"

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

##################################################
# Egress Rule
##################################################

/*
Allows all outgoing traffic.
*/

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {

    Name = "Terraform Security Group"

  }

}

##################################################
# EC2 Instance
##################################################

/*
Creates an EC2 Instance.

Uses

AMI

Instance Type

Security Group
*/

resource "aws_instance" "web" {

  ami = var.ami

  instance_type = var.instance_type

  vpc_security_group_ids = [

    aws_security_group.web_sg.id

  ]

  tags = {

    Name = "Terraform-EC2"

  }

}

##################################################
# Outputs
##################################################

/*
Outputs

Displays useful information
after infrastructure is created.
*/

output "instance_id" {

  value = aws_instance.web.id

}

output "public_ip" {

  value = aws_instance.web.public_ip

}

output "security_group" {

  value = aws_security_group.web_sg.id

}

/*
==========================================

Commands Used

terraform init
Initializes Terraform.

terraform fmt
Formats code.

terraform validate
Checks syntax.

terraform plan
Shows execution plan.

terraform apply
Creates resources.

terraform output
Displays outputs.

terraform destroy
Deletes infrastructure.

==========================================
*/