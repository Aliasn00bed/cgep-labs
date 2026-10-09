#terraform/primitives/compliant-gcs-main.tf
#this module is for the dev consumer.
terraform {
    required_version        = ">=1.6"
    required_providers {
        google = { source = "hashicorp/google", version = "~>5.0" }
    }
}

provider "google" {
    project = "cgep-labs"
    region  = "us-central1"
}

module "data bucket" {
    source          = "../../modules/compliant-gcs-bucket"

    gcp_project     = "cgep-labs"
    project_label   = "cgep-labs"
    environment     = "dev"
    retention_days  = 30
    bucket_name_suffix = "devdat01"
}

output "attestation"    { value = module.data_bucket.compliance_attestation }
output "bucket_url"     { value = module.data_bucket.bucket_url }
output "kms_key_id"     { value = module.data_bucket.kms_key_id }
