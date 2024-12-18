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