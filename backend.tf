terraform {
  backend "s3" {
    bucket = "devopsking"
    key    = "kingdevops/state"
    region = "us-east-1"
  }
}