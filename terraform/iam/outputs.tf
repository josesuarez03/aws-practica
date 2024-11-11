output "user1_arn" {
  description = "ARN of the first IAM user"
  value       = try(data.aws_iam_user.user1.arn, try(aws_iam_user.user1[0].arn, null))
}

output "user2_arn" {
  description = "ARN of the second IAM user"
  value       = try(data.aws_iam_user.user2.arn, try(aws_iam_user.user2[0].arn, null))
}