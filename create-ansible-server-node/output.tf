output "ansible_server_ip" {
  description = "The IP address of the Ansible server"
  value       = aws_instance.ansible_server.public_ip
}
output "ansible_node_ip" {
  description = "The IP address of the Ansible managed node"
  value       = aws_instance.ansible_node.public_ip
}