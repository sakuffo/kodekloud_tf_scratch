resource "aws_instance" "webserver" {
  ami           = "ami-0885b1f6bd170450c"
  instance_type = "t3.micro"
  tags = {
    "Name"   = "webserver"
    "course" = "kodekloud"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
    ]
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.webserver.public_ip} >> ./ips.txt"
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("~/.ssh/tf_ec2")
  }
  #user_data
  # user_data = <<EOF
  #             #!/bin/bash
  #             sudo apt update
  #             sudo apt install nginx -y
  #             systemctl enable nginx
  #             systemctl start nginx
  #             EOF

  key_name               = aws_key_pair.web.key_name
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
}

resource "aws_key_pair" "web" {
  key_name   = "tf_ec2"
  public_key = file("~/.ssh/tf_ec2.pub")
}

resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "AllowSSH access from the Internet"
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
}

output "web_ip" {
  value = aws_instance.webserver.public_ip
}