# ==============================================================================
# 1. ALMACENAMIENTO (DATA LAKE & CHECKPOINTS)
# Servirá para guardar los datos procesados y el estado de Flink.
# ==============================================================================
resource "aws_s3_bucket" "storage_practice" {
  bucket = "${var.project_name}-${var.environment}-streaming"
}

resource "aws_s3_bucket_public_access_block" "storage_practice_access" {
  bucket = aws_s3_bucket.storage_practice.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ==============================================================================
# 2. INGESTA DE DATOS (FUTURO: AMAZON KINESIS DATA STREAMS)
# TODO: Agregar aquí el recurso 'aws_kinesis_stream' para recibir eventos en vivo.
# ==============================================================================


# ==============================================================================
# 3. PROCESAMIENTO EN TIEMPO REAL (FUTURO: AMAZON MANAGED SERVICE FOR APACHE FLINK)
# TODO: Agregar aquí el recurso 'aws_kinesisanalyticsv2_application' y sus roles IAM.
# ==============================================================================
