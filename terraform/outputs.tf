output "web_public_ip" {
  value = module.compute.public_ip
}

output "web_public_dns" {
  value = module.compute.public_dns
}

output "web_url" {
  value = "http://${module.compute.public_dns}"
}