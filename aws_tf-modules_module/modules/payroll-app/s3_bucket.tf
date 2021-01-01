resource "aws_s3_bucket" "payroll_data" {
  count = 1
  bucket = "${var.app_region}-${var.bucket}-${count.index}"
}