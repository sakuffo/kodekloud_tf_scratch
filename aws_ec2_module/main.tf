resource "aws_instance" "webserver" {
    ami = "ami-0edab43b6fa892279" 
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
}