output "instance_ip" {
  value = aws_instance.app.public_ip
}

output "ecr_repo_url" {
  value = aws_ecr_repository.user_service.repository_url
}