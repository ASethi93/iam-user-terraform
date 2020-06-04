provider "aws" {
  region                  = "ca-central-1"
  profile                 = "default"
}

resource "aws_iam_user" "u" {
  name          = "terraform3"
  path          = "/"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "u" {
  user    = "${aws_iam_user.u.name}"
  pgp_key = "keybase:bi"
}

output "password" {
  value = "${aws_iam_user_login_profile.u.encrypted_password}"
}
