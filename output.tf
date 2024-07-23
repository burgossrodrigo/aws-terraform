output "instance_id" {
    description = "value of the instance id"
    value = aws_instance.bia-dev.id
}

output "instance_public_ip" {
    description = "value of the instance public ip"
    value = aws_instance.bia-dev.public_ip
}

output "instance_type" {
  description = "value of the instance type"
  value = aws_instance.bia-dev.instance_type
}