/*
====================================================
Day 14 - Terraform Mini Project
====================================================

Project Goal
------------
Provision AWS infrastructure using Terraform.

Resources Created
-----------------
✔ AWS Provider
✔ Security Group
✔ EC2 Instance

Terraform Workflow
------------------

Write Code
      ↓
terraform init
      ↓
terraform validate
      ↓
terraform fmt
      ↓
terraform plan
      ↓
terraform apply
      ↓
Infrastructure Created

====================================================
*/

####################################################
# Terraform Block
####################################################

/*
Purpose
-------
Specifies the Terraform version and
downloads the required providers.
*/

terraform {

  required_version = ">= 1.0"

  required_providers {

    aws = {

      source  = "hashicorp/aws"
      version = "~> 5.0"

    }

  }

}

####################################################
# AWS Provider
####################################################

/*
Purpose
-------
Connects Terraform with AWS.

Region
------
ap-south-1 = Mumbai
*/

provider "aws" {

  region = var.region

}

####################################################
# Variables
####################################################

/*
Variables make the code reusable.
Instead of hardcoding values,
we can change them whenever needed.
*/

variable "region" {

  description = "AWS Region"

  default = "ap-south-1"

}

variable "instance_type" {

  description = "EC2 Instance Type"

  default = "t2.micro"

}

variable "ami" {

  description = "Ubuntu AMI"

  default = "ami-xxxxxxxx"

}

####################################################
# Security Group
####################################################

/*
Purpose
-------
Acts as a Virtual Firewall.

Ingress
-------
Incoming Traffic

Egress
------
Outgoing Traffic
*/

resource "aws_security_group" "web_sg" {

  name        = "terraform-web-sg"

  description = "Allow SSH and HTTP"

  ##################################################
  # SSH Rule
  ##################################################

  ingress {

    description = "Allow SSH"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ##################################################
  # HTTP Rule
  ##################################################

  ingress {

    description = "Allow HTTP"

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ##################################################
  # HTTPS Rule
  ##################################################

  ingress {

    description = "Allow HTTPS"

    from_port = 443

    to_port = 443

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ##################################################
  # Outbound Traffic
  ##################################################

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

####################################################
# EC2 Instance
####################################################

/*
Purpose
-------
Creates an EC2 Virtual Machine.

Uses

• AMI
• Instance Type
• Security Group

Tags help identify resources.
*/

resource "aws_instance" "web" {

  ami = var.ami

  instance_type = var.instance_type

  vpc_security_group_ids = [

    aws_security_group.web_sg.id

  ]

  tags = {

    Name = "Terraform Mini Project"

    Environment = "Development"

    ManagedBy = "Terraform"

  }

}

####################################################
# Outputs
####################################################

/*
Outputs display useful information
after Terraform creates resources.
*/

output "instance_id" {

  description = "EC2 Instance ID"

  value = aws_instance.web.id

}

output "public_ip" {

  description = "Public IP Address"

  value = aws_instance.web.public_ip

}

output "security_group_id" {

  description = "Security Group ID"

  value = aws_security_group.web_sg.id

}

####################################################
# Terraform Commands
####################################################

/*

terraform init
--------------
Initializes the Terraform project
and downloads provider plugins.

terraform fmt
-------------
Formats Terraform code.

terraform validate
------------------
Checks Terraform syntax.

terraform plan
--------------
Shows execution plan before creating resources.

terraform apply
---------------
Creates infrastructure.

terraform show
--------------
Displays Terraform state.

terraform output
----------------
Displays output values.

terraform state list
--------------------
Lists resources managed by Terraform.

terraform destroy
-----------------
Deletes all infrastructure.

====================================================
Important Terraform Files
====================================================

provider.tf
------------
Configures cloud provider.

main.tf
--------
Contains infrastructure resources.

variables.tf
-------------
Stores input variables.

terraform.tfvars
----------------
Stores values for variables.

outputs.tf
-----------
Displays useful information.

terraform.tfstate
-----------------
Stores current infrastructure state.

====================================================
Best Practices
====================================================

✔ Never hardcode values

✔ Use variables

✔ Use outputs

✔ Run terraform fmt

✔ Run terraform validate

✔ Review terraform plan before apply

✔ Add tags to resources

✔ Store state file securely

====================================================
End of Day 14
====================================================
*/