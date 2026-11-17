variable "region" {
  description = "Región de AWS donde se desplegará la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nombre del proyecto para identificar los recursos"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (ej. dev, staging, prod)"
  type        = string
  default     = "dev"
}
