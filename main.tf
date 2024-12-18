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

  # Prevents direct pushes to the protected branch
  allows_deletions                = false
  allows_force_pushes            = false
  requires_signed_commits        = true
  required_linear_history        = true
  require_conversation_resolution = true

  # Require pull request before merging
  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
    require_last_push_approval      = true
  }

  # Require status checks to pass before merging
  required_status_checks {
    strict = true
    contexts = ["continuous-integration/jenkins"]  # Replace with your CI contexts
  }

  # Push restrictions
  restrict_pushes {
    push_allowances = []  # Empty list means no direct pushes allowed
  }
}

# Optionally, you can add outputs to verify the protection rules
output "protected_branches" {
  description = "List of repositories with branch protection enabled"
  value = {
    for repo in var.repository_names :
    repo => github_branch_protection.main[repo].pattern
  }
}