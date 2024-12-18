# GitHub Branch Protection Terraform Configuration

Automate GitHub repository branch protection rules using Terraform. This configuration enforces consistent security practices across multiple repositories.

## Features

✨ This configuration implements:

- 🛡️ Protection against direct pushes to main branch
- 🔄 Required pull requests for all changes
- ✍️ Required signed commits
- 📝 Required linear history
- 💬 Required conversation resolution
- 👥 Required code review approval
- ⚠️ Protection against force pushes
- 🗑️ Protection against branch deletion

## Prerequisites

- Terraform (v0.12 or later)
- GitHub personal access token with `repo` and `admin:org` scopes
- Git credentials configured locally

## Setup

1. Clone and navigate to the repository:
```bash
git clone <repository-url>
cd <repository-name>

## Allow GitHub Access
export TF_VAR_github_token="your-github-token"
terraform init
terraform plan
terraform apply




## This configuration:

Prevents direct pushes to main branch
Requires pull requests for all changes
Requires signed commits
Requires linear history
Requires conversation resolution
Requires code review approval
Prevents force pushes
Prevents branch deletion

You can customize the protection rules by modifying the github_branch_protection resource. For example:

Change the required number of approving reviews
Adjust status check requirements
Modify push restrictions
Change the protected branch pattern