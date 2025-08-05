output "public-ip-dev" {
    value = aws_instance.dev.public_ip
  
}
output "public-ip-test" {
    value = aws_instance.test.public_ip
  
}