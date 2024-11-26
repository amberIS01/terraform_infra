terraform {
  backend "s3" {
    bucket = "devops-terraform-bu"
    key    = "infra/statefile"
    region = "us-east-1"
  }
}