variable "hostname" {
  description = "hostname of the TFE instance you want to create the resources"
  default     = "tftest.guy.sbx.hashidemos.io"
}

variable "token"{
    description = "token used to authenticate to TFE"
    sensitive = true
}

variable "workspaces_count" {
  description = "The amount of Workspaces you want to create per orgss"
  default     = 10
}

variable "github_app_id"{
    description = "Github App id so VCS integration can be used from all Orgs"
}