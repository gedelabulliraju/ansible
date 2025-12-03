###############################################
# Security Group for Server and Node
###############################################
resource "aws_security_group" "ansible_server_sg" {
  name        = "ansible-sg"
  description = "Security group for Ansible server & node"

  # Allow SSH from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow http from anywhere
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound (required for dnf install)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

###############################################
# Ansible Server (RHEL AMI)
###############################################
resource "aws_instance" "ansible_server" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.ansible_server_sg.id]


  tags = {
    Name = "Ansible-Server"
  }

}

###############################################
# Ansible Node (RHEL AMI)
###############################################
resource "aws_instance" "ansible_node" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.ansible_server_sg.id]

  tags = {
    Name = "Ansible-Node"
  }
}
