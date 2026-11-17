output "bucket_name" {
  description = "Nombre del bucket S3 creado en AWS"
  value       = aws_s3_bucket.storage_practice.id
}

output "bucket_arn" {
  description = "Identificador único (ARN) del bucket S3"
  value       = aws_s3_bucket.storage_practice.arn
}

output "region_used" {
  description = "Región de AWS donde se desplegó el proyecto"
  value       = var.region
}
