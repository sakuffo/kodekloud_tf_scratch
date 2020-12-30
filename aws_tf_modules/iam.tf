resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
      Description = "Technical Team Leader"
      course = "kodekloud"
  }
}

resource "aws_iam_policy" "adminUser" {
  name = "AdminUsers"
  policy =file("./policy-docs/admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "lucy-admin-access" {
  user = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.adminUser.arn
}

resource "aws_iam_user" "users" {
  name = "mary"
}
