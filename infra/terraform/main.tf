provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "jenkins_key" {
  key_name   = "jenkins-key"
  public_key = var.public_key
}

resource "aws_security_group" "ec2_sg" {
  name        = "allow_ssh_and_app"
  description = "Allow SSH and port 3000"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami                         = "ami-05a4fc6eaa38ee23c"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.jenkins_key.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "user-service-ec2"
  }
}

resource "aws_ecr_repository" "user_service" {
  name = "user-service"
}

resource "aws_ecr_lifecycle_policy" "user_service_policy" {
  repository = aws_ecr_repository.user_service.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 10 images with 'prod' prefix",
        selection = {
          tagStatus     = "tagged"
          tagPrefixList = ["prod"]
          countType     = "imageCountMoreThan"
          countNumber   = 10
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
}

output "instance_ip" {
  value = aws_instance.app.public_ip
}

output "ecr_repo_url" {
  value = aws_ecr_repository.user_service.repository_url
}