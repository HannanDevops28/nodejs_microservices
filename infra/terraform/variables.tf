# No vars for now, but you can modularize later.
variable "key_name" {
  type        = string
  description = "EC2 key pair name in AWS"
}

variable "public_key_path" {
  type        = string
  description = "Local path to your public key"
}
variable "public_key" {
  description = "Public key for EC2 access"
  type        = string
}
