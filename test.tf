resource "aws_instance" "example" {
  count = 1
  ami           = "ami-01cd4de4363ab6ee8"
  instance_type = "t2.micro"
  tags = {
    name = "web_server"
  }

}
