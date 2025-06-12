
resource "tfe_organization" "test-1-organization" {
  name  = "Lupin-1-org"
  email = "guy@hashicorp.com"
}
resource "tfe_organization" "test-2-organization" {
  name  = "Lupin-2-org"
  email = "guy@hashicorp.com"
}
resource "tfe_organization" "test-3-organization" {
  name  = "Lupin-3-org"
  email = "guy@hashicorp.com"

}
resource "random_pet" "test-1-workspaces" {
 count = var.workspaces_count
}

resource "tfe_workspace" "test-1-workspaces" {
    depends_on = [ tfe_organization.test-1-organization ]
    count = var.workspaces_count
  name         = "${random_pet.test-1-workspaces[count.index].id}-workspace"
  organization = tfe_organization.test-1-organization.name
  tag_names    = ["lupin-1"]
  auto_apply = true
  allow_destroy_plan = true
  force_delete = true
   vcs_repo {
    branch             = "main"
    identifier         = "GuyBarros/terraform-local-rum-demo"
    github_app_installation_id     = var.github_app_id
  }
}

resource "random_pet" "test-2-workspaces" {
 count = var.workspaces_count
}

resource "tfe_workspace" "test-2-workspaces" {
    depends_on = [ tfe_organization.test-2-organization ]
    count = var.workspaces_count
  name         = "${random_pet.test-2-workspaces[count.index].id}-workspace"
  organization = tfe_organization.test-2-organization.name
  tag_names    = ["lupin-2"]
  auto_apply = true
  allow_destroy_plan = true
  force_delete = true
   vcs_repo {
    branch             = "main"
    identifier         = "GuyBarros/terraform-local-rum-demo"
    github_app_installation_id     = var.github_app_id
  }
}

resource "random_pet" "test-3-workspaces" {
 count = var.workspaces_count
}

resource "tfe_workspace" "test-3-workspaces" {
    depends_on = [ tfe_organization.test-3-organization ]
  count = var.workspaces_count
  name         = "${random_pet.test-3-workspaces[count.index].id}-workspace"
  organization = tfe_organization.test-3-organization.name
  tag_names    = ["lupin-3"]
  auto_apply = true
  allow_destroy_plan = true
  force_delete = true
   vcs_repo {
    branch             = "main"
    identifier         = "GuyBarros/terraform-local-rum-demo"
    github_app_installation_id     = var.github_app_id
  }
}
