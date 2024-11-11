terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "terraform-infrastructure-375943871844" # Replace with your account ID
    dynamodb_table = "terraform-state-lock"
    key            = "terraform.tfstate"
    region         = "eu-west-1" # Change to the appropriate region
  }
}

provider "aws" {
    region = "eu-west-1"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "data" {
    bucket = "bucket-data-${data.aws_caller_identity.current.account_id}"

    tags = var.tags
}

resource "aws_budgets_budget" "ec2" {
    name              = "budget-ec2-monthly-tf"
    budget_type       = "COST"
    limit_amount      = "15"
    limit_unit        = "USD"
    time_period_end   = "2087-06-15_00:00"
    time_period_start = "2024-11-06_12:30"
    time_unit         = "MONTHLY"

    cost_filter {
        name = "Service"
        values = [
            "Amazon Elastic Compute Cloud - Compute",
        ]
    }

    notification {
        comparison_operator        = "GREATER_THAN"
        threshold                  = 50
        threshold_type             = "PERCENTAGE"
        notification_type          = "ACTUAL"
        subscriber_email_addresses = [var.email]
    }

    notification {
        comparison_operator        = "GREATER_THAN"
        threshold                  = 25
        threshold_type             = "PERCENTAGE"
        notification_type          = "ACTUAL"
        subscriber_email_addresses = [var.email]
    }

    notification {
        comparison_operator        = "GREATER_THAN"
        threshold                  = 80
        threshold_type             = "PERCENTAGE"
        notification_type          = "ACTUAL"
        subscriber_email_addresses = [var.email]
    }

    tags = {
        Tag1 = "Value1"
        Tag2 = "Value2"
    }
}

module "iam" {
    source     = "./iam"
    user1_name = "josesuarez" 
    user2_name = "terraform"
}

