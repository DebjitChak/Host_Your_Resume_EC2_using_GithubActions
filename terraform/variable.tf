variable "region" {
 type=string
 default="us-west-2"
}
variable "username" {
  description = "The username for the EC2 instance"
  type        = string
 # default = "ubuntu"
}

variable "password" {
  description = "The password for the EC2 instance"
  type        = string
  sensitive   = true
  #default ="test"
}

variable "aws_access_key"{
    type = string 


}

variable "aws_secret_key"{
    type=string
   
}

