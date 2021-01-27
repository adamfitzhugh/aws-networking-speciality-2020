terraform {
  backend "remote" {
    organization = "adamfitzhugh-github"

    workspaces {
      name = "aws-networking-speciality-2020"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}