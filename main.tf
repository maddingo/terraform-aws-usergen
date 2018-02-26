locals {
    create_login_profile = "${length(var.pgp_key) > 0 ? 1 : 0}"
}

resource "aws_iam_user" "this" {
  count         = "${length(var.user_names)}"
  name          = "${var.user_names[count.index]}"
  force_destroy = "true"
  path          = "/"
}

resource "aws_iam_user_login_profile" "this" {
  count         = "${length(var.user_names) * local.create_login_profile}"
  user          = "${var.user_names[count.index]}"
  pgp_key       = "${var.pgp_key}"
  depends_on    = ["aws_iam_user.this"]
}


resource "aws_iam_user_policy_attachment" "policy_attach" {
	count         = "${length(var.iam_policies) * length(var.user_names)}"
  	user          = "${var.user_names[count.index % length(var.user_names)]}"
	policy_arn    = "${var.iam_policies[(count.index) / length(var.user_names)]}"
	depends_on    = ["aws_iam_user.this"]
}
