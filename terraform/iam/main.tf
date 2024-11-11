data "aws_iam_user" "user1" {
  user_name = var.user1_name
}

# Lookup for an existing IAM user for user2
data "aws_iam_user" "user2" {
  user_name = var.user2_name
}

# Conditionally create IAM user if it doesn't already exist
resource "aws_iam_user" "user1" {
  count = try(data.aws_iam_user.user1.user_name, "") == "" ? 1 : 0
  name  = var.user1_name
}

resource "aws_iam_user" "user2" {
  count = try(data.aws_iam_user.user2.user_name, "") == "" ? 1 : 0
  name  = var.user2_name
}