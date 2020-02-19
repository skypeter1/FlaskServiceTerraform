
variable "key_name" {
  default = "test-key"
}

## Create a key pair for ssh access
resource "tls_private_key" "example" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
    key_name   = var.key_name
    public_key = tls_private_key.example.public_key_openssh
}

## Create a security group for the EC2 instance
resource "aws_security_group" "group" {
    name        = "terraform-test-group"
    description = "My security group for my flask service"

    ## SSH access 
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ## Docker service access on port 8000
    ingress {
        from_port = 8000
        to_port = 8000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # outbound internet access
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }  
}

data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["099720109477"] # Canonical
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
    }
}

resource "aws_instance" "flask" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    key_name      = aws_key_pair.generated_key.key_name
    security_groups = [aws_security_group.group.name]
    connection  {
      host = self.public_ip
      type = "ssh"
      user = "ubuntu"
      private_key = tls_private_key.example.private_key_pem 
    }
    provisioner "file" {
          source = "./scripts/"
          destination = "/tmp/"
      }	
    provisioner "remote-exec" {
    inline = [
          "sh /tmp/install-docker.sh"
      ]
    }  

}