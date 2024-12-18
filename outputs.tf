# Outputs
output "protected_repositories" {
  description = "List of repositories with branch protection"
  value       = values(github_branch_protection.main)[*].repository_id
}

output "protection_pattern" {
  description = "Branch pattern being protected"
  value       = values(github_branch_protection.main)[*].pattern
}

output "required_reviews" {
  description = "Number of required reviews for protected branches"
  value       = values(github_branch_protection.main)[*].required_pull_request_reviews[0].required_approving_review_count
}