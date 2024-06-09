data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}




/*data "aws_subnet" "default" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.main.id]
  }

  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}*/
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type 
  subnet_id     = aws_subnet.example.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  user_data = <<-EOF
              #!/bin/bash
              sudo useradd -m -s /bin/bash ${var.username}
              echo "${var.username}:${var.password}" | sudo chpasswd
              EOF
  tags = {
    Name = "Resume_Hoster"
  }
}

# output "public_ip" {
#   value = aws_instance.web.public_ip
# }
