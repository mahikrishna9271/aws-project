terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws" #these two are maps
      version = "~> 5.0"
    }
  }
}

#provider block is used to configure the provider settings, such as the region and credentials. In this case, the AWS provider is being configured to use the "ap-south-1" region.
provider "aws" {
  region = "ap-south-1"
}
