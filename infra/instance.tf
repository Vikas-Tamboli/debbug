resource "aws_instance" "web" {
  ami = "ami-09052aa9bc337c78d"
  instance_type = "t2.micro"

  tags = {
    Name = "manu"
  }
}

