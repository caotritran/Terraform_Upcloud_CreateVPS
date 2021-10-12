output "publicIP" {
  value = upcloud_server.newvps.network_interface[0].ip_address
}

output "password" {
  value = random_string.random.id
}