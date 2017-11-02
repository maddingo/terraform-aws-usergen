variable "user_names" {
    type        = "list"
    description = "list of user names to populate in IAM"
}

variable "iam_policies" {
    type        = "list"
    description = "list of ARN IAM policies to attach to the list of users"
}

variable "pgp_key" {
    description = "pgp for encrption of the user profile password generated"
} 