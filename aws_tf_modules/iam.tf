resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
      Description = "Technical Team Leader"
      course = "kodekloud"
  }
}