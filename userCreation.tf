##### AWS credential defined in Environment variable
##### AWS_ACCESS_KEY_ID
##### AWS_SECRET_ACCESS_KEY


#Create A User

# AWS provider - Region = USA East OHI
provider "aws" {
  region = "us-east-2" 
}

#Create IAM User
resource "aws_iam_user" "admin_user" {
  name = "terra-admin-user"  # username
}

# Create an IAM policy for admin permissions
##### No need to create if we already have a policy


# Attach the admin policy to the user
resource "aws_iam_user_policy_attachment" "admin_policy_attachment" {
  user       = aws_iam_user.admin_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Optionally, create access keys for the user
resource "aws_iam_access_key" "admin_access_key" {
  user = aws_iam_user.admin_user.name
}