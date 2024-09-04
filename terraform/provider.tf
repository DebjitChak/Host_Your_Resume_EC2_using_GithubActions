provider "aws" {
  
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "artifact-s3-bucket-568245924140"      # Replace with your bucket name
    key            = "terraform_state"        # Path within the bucket
    region         = "us-west-2"                      # Replace with your region
  }
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"  
}

# AWS EC2 Instance Key Pair
# variable "instance_keypair" {
#   description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
#   type = string
#   default = "terraform-key"
# }
