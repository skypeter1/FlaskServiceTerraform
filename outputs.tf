output "ec_address" {
  value = "${aws_instance.flask.public_dns}"
}

output "tls_private_key" {
  value = "${tls_private_key.example.public_key_openssh}"
}

output "public_key_pem" {
  value = "${tls_private_key.example.public_key_pem}"
}

output "private_key_pem" {
  value = "${tls_private_key.example.private_key_pem}"
}
