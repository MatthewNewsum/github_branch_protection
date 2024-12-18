# Configure the GitHub Provider
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = var.github_token
}

variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

# Variable for repository names that need protection
variable "repository_names" {
  description = "List of repository names to protect"
  type        = list(string)
}

# Branch protection resource
resource "github_branch_protection" "main" {
  for_each = toset(var.repository_names)

  repository_id = each.value
  pattern       = "main"  # You can change this to protect different branches

  # Basic protection settings
  allows_deletions                = false
  allows_force_pushes            = false
  require_signed_commits         = false  # Simplified for basic protection
  required_linear_history        = true
  require_conversation_resolution = true

  # Require pull request before merging
  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = false  # Simplified
    required_approving_review_count = 0
    require_last_push_approval      = true
  }
  
  # Push restrictions
  push_restrictions = []  # Prevents direct pushes to main
}