variable "email" {
    description = "Email address for budget notifications"
    type        = string
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
        subscriber_email_addresses = ["var.email"]
    }

    notification {
        comparison_operator        = "GREATER_THAN"
        threshold                  = 25
        threshold_type             = "PERCENTAGE"
        notification_type          = "ACTUAL"
        subscriber_email_addresses = ["var.email"]
    }
    notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["var.email"]
    }

    tags = {
        Tag1 = "Value1"
        Tag2 = "Value2"
    }
}