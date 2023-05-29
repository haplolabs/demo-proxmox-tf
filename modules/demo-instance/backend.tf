terraform {
  backend "s3" {
    bucket = "haplolabs-home-tf-state"
    key    = "new-demo-instance/terraform.tfstate"

    # endpoint = set via -backend-config="endpoint=${s3_endpoint}"
    # access_key = set via -backend-config="access_key=${access_key}"
    # secret_key = set via -backend-config="secret_key=${secret_key}"
    # region = set via -backend-config="state_region=${state_region}"

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  }
}
