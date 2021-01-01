resource "aws_s3_bucket" "finance" {
  bucket    = "finance-saa-122020"
  tags = {
    Description = "Finance and Payroll"
    course = "kodekloud"
  }
}

resource "aws_s3_bucket_object" "finance-2020" {
  content = "/root/finance/finance-2020.doc"
  key   = "finance-2020.doc"
  bucket = aws_s3_bucket.finance.id
}

data "aws_iam_group" "finance-data" {
    group_name = "finance-analysts"
}

resource "aws_s3_bucket_policy" "finance-policy" {
  bucket = aws_s3_bucket.finance.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "*",
            "Resource": "arn:aws:s3:::${aws_s3_bucket.finance.bucket}/*",
            "Principal": {
                "AWS": [
                    "${aws_iam_user.admin-user.arn}"
                ]
            }
        }
    ]
}
  EOF

}