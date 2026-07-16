/*
===========================================
Day 12 - Terraform Supporting File
===========================================

This file contains the basic Terraform configuration
along with explanations of each section.

===========================================
1. Terraform Block
===========================================

Purpose:
- Specifies the Terraform version.
- Downloads the required provider plugins.
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

/*
Explanation

required_version
- Defines the minimum Terraform version.

required_providers
- Specifies which provider Terraform should use.

source
- Downloads the provider from the Terraform Registry.

version
- Specifies the provider version.
*/


/*
===========================================
2. Provider Block
===========================================

Purpose:
- Configures the cloud provider.
- Tells Terraform where to create resources.
*/

provider "aws" {

  region = "ap-south-1"

}

/*
Explanation

provider "aws"
- Uses Amazon Web Services.

region
- AWS region where infrastructure will be created.
- Example:
  ap-south-1 = Mumbai
  us-east-1 = Virginia
*/


/*
===========================================
3. Common Terraform Commands
===========================================

terraform init
---------------
Initializes the Terraform project.
Downloads provider plugins.

terraform fmt
--------------
Formats Terraform code.

terraform validate
-------------------
Checks configuration syntax.

terraform plan
---------------
Shows what resources Terraform will create,
modify or delete before making changes.

terraform apply
----------------
Creates or updates infrastructure.

terraform show
---------------
Displays the current Terraform state.

terraform output
-----------------
Displays output values after deployment.

terraform state list
---------------------
Lists all resources managed by Terraform.

terraform destroy
------------------
Deletes all resources created by Terraform.
*/


/*
===========================================
4. Terraform Workflow
===========================================

Write Terraform Code

        ↓

terraform init

        ↓

terraform validate

        ↓

terraform plan

        ↓

terraform apply

        ↓

Infrastructure Created

        ↓

terraform destroy
*/


/*
===========================================
5. Important Terraform Files
===========================================

provider.tf
------------
Configures the cloud provider.

main.tf
---------
Contains infrastructure resources.

variables.tf
-------------
Stores input variables.

terraform.tfvars
-----------------
Stores values for variables.

outputs.tf
-----------
Displays useful information after deployment.

terraform.tfstate
------------------
Stores the current state of infrastructure.
*/