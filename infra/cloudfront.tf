resource "aws_cloudfront_distribution" "static-distribution" {
  origin {
    domain_name              = aws_s3_bucket.static-s3.bucket_regional_domain_name
    origin_id                = "S3-static-website"
    origin_access_control_id = aws_cloudfront_origin_access_control.cloudfront-static-website.id
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id       = "S3-static-website"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    Name = "static-website-distribution"
  }
}

resource "aws_cloudfront_origin_access_control" "cloudfront-static-website" {
  name                              = "static-website-oac"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
