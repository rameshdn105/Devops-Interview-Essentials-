# modules/ec2/outputs.tf
output "public_ip" {
  value = aws_instance.app_server.public_ip
}
