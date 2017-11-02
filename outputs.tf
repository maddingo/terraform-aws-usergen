output "all_passwords" {
  value = "${join("," , aws_iam_user_login_profile.this.*.encrypted_password)}"
  description = "Comma separated list of IAM passwords. Base64 encoded and encrypted using the pgp_key supplied"
}