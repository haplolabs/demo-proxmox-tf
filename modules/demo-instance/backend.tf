terraform {
  backend "s3" {
    bucket = "haplolabs-home-tf-state"
    key = "demo-instance/terraform.tfstate"

    endpoint = var.s3_endpoint

    access_key = var.access_key
    secret_key = var.secret_key

    region = var.state_region 
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_region_validation = true
    force_path_style = true
  }
}
