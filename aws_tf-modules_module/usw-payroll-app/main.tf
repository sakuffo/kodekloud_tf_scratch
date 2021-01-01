module "usw_payroll" {
  source = "../modules/payroll-app"
  app_region = "us-west-2"
  ami = "ami-07dd19a7900a1f049"
}