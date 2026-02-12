output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.static-distribution.domain_name
}
