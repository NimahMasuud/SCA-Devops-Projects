/*
# Example Terraform Configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Example Remote Backend Block
  backend "s3" {
    bucket         = "my-terraform-state-storage"
    key            = "assessment/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

# Example resource (not created, just for code sample)
resource "aws_s3_bucket" "example" {
  bucket = "my-test-assessment-bucket-999"
}
*/
# Milestone 2 Assessment: Terraform Configuration
terraform {
  # We are commenting out the cloud requirements so the command runs locally for your screenshot.
  
  /* 
  backend "s3" {
    bucket         = "my-terraform-state-storage"
    key            = "assessment/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
  */
}

# This dummy resource allows 'terraform plan' to work without an AWS connection
resource "local_file" "assessment_note" {
  content  = "This is a test for the Milestone 2 Assessment."
  filename = "${path.module}/success.txt"
}
