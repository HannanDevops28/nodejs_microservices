provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "your-key" {
  key_name   = "your-keny-name"
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
  ami                         = "add-your-ami"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.your-key.key_name
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

