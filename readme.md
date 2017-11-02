# terraform-aws-usergen

This is a module to create like groupings of users with the same IAM policies attached.

Example:
```hcl
module "users" {
    source = source = "walked/usergen/aws"
    pgp_key = "keybase:walked"
    user_names = ["Test1","test2"]
    iam_policies = ["arn:aws:iam::aws:policy/IAMUserChangePassword", "${aws_iam_policy.example_policy.arn}"]    
}

output "all_passwords" {
  value =  "${module.users.all_passwords}"
}
```

You can create multiple groups of users with different properties:

```hcl
module "user_group1" {
    source = "walked/usergen/aws"
    pgp_key = "keybase:walked"
    user_names = ["Test1","test2"]
    iam_policies = ["arn:aws:iam::aws:policy/IAMUserChangePassword"]    
}

output "user_group1_passwords" {
  value =  "${module.user_group1.all_passwords}"
}

module "user_group2" {
    source = "walked/usergen/aws"
    pgp_key = "keybase:walked"
    user_names = ["otherUsers","moreUsers"]
    iam_policies = ["${aws_iam_policy.example_policy.arn}", "${aws_iam_policy.example_policy2.arn}"]    
}

output "user_group2passwords" {
  value =  "${module.user_group2..all_passwords}"
}
```