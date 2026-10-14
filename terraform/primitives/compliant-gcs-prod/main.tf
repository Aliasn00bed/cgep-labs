#terraform/primitives/compliant-gcs-prod/main.tf
#this is the prod consumer code.
module "data_bucket" {
    source = "../..modules/compliant-gcs-bucket"

    gcp_project         = "cgep-labs"
    project_label       = "cgep-labs"
    environment         = "prod"
    retention_days      = 365
    bucket_name_suffix  = "prod-dat + ${count.index}"
}
