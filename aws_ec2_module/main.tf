resource "aws_instance" "webserver" {
    ami = "ami-0885b1f6bd170450c" 
    instance_type = "t3.micro"
    tags = {
      "Name" = "webserver"
      "course" = "kodekloud"
    }
    user_data = <<EOF
                #!/bin/bash
                sudo apt update
                sudo apt install nginx -y
                systemctl enable nginx
                systemctl start nginx
                EOF

    key_name = aws_key_pair.web.id
}

resource "aws_key_pair" "web" {
  public_key = file("~/.ssh/tf_ec2.pub")
}

resource "aws_security_group" "ssh-access" {
  name = "ssh-access"
  description = "AllowSSH access from the Internet"
  ingress{
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 22
    protocol = "tcp"
    to_port = 22
  }
}