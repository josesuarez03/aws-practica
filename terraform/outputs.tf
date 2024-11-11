output "budget_id" {
    description = "The ID of the AWS budget"
    value       = aws_budgets_budget.ec2.id
}

output "data_bucket_name" {
    description = "The name of the dynamically created S3 bucket for data"
    value       = aws_s3_bucket.data.bucket
}

output "data_bucket_arn" {
    description = "The ARN of the dynamically created S3 bucket for data"
    value       = aws_s3_bucket.data.arn
}
