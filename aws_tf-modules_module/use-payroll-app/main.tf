module "use_payroll" {
  source = "../modules/payroll-app"
  app_region = "us-east-1"
  ami = "ami-0885b1f6bd170450c"
}