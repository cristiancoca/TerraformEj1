# Ejercicio de practica armado de estructura inicial Scaffolding con Terraform

Este proyecto define la estructura inicial (*scaffolding*) de infraestructura como código (IaC) en AWS utilizando **Terraform** para una plataforma de datos que eventualmente incluira **Amazon Kinesis** y **Apache Flink**.

---

## Estructura del Proyecto y Justificación

Un único archivo `main.tf`es difícil de leer y mantener. El código se dividió siguiendo las mejores prácticas estándar de HashiCorp:

* **`provider.tf`**: versiones mínimas requeridas (Terraform y el proveedor de AWS) y configura las etiquetas globales (`default_tags`). Separarlo facilita las actualizaciones de versión.
* **`variables.tf`**: declara tipos de datos y descripciones claras. Permite reutilizar el mismo código en distintos entornos (`dev`, `staging`, `prod`).
* **`terraform.tfvars.example`**: plantilla segura para que otros desarrolladores sepan qué valores configurar, manteniendo el archivo real (`terraform.tfvars`) protegido.
* **`main.tf`**: Contiene exclusivamente la definición de la infraestructura principal (actualmente el bucket S3, junto con los bloques estructurales reservados para Kinesis y Flink).
* **`outputs.tf`**: Expone los identificadores y ARNs generados tras el despliegue, evitando tener que buscarlos manualmente en la consola web de AWS.
* **`.gitignore`**: Evita subir archivos pesados (`.terraform/`), datos sensibles (`*.tfvars`) y el estado local (`*.tfstate`) al repositorio.

---

## Convención de Nombres (Naming Convention)

Para mantener el orden, facilitar la trazabilidad de costos y evitar conflictos de nombres globales en AWS (especialmente en servicios como S3), se adoptó una nomenclatura dinámica basada en variables:

### 1. Recursos creados en AWS
Se sigue el patrón: **`<project_name>-<environment>-<función-del-recurso>`**
* **Ejemplo generado:** `practica-terraform-dev-streaming`
* **Justificación:** Permite identificar a simple vista a qué proyecto y entorno pertenece cada recurso dentro de la consola de AWS, asegurando unicidad global y evitando el *hardcoding*.

### 2. Identificadores internos en Terraform
Se utiliza el formato **`snake_case`** (minúsculas separadas por guiones bajos) enfocado en el rol funcional del recurso dentro de la práctica (por ejemplo: `storage_practice` y `storage_practice_access`), evitando redundancias con el tipo de recurso oficial.

---

## Cómo Inicializar y Validar el Proyecto

### Prerrequisitos
* [Terraform](https://hashicorp.com) versión `>= 1.0.0` instalado.
* Credenciales de AWS configuradas localmente (en caso de ejecutar planes o despliegues reales).

### Pasos de ejecución

1. **Clonar el repositorio y entrar al directorio:**
   ```bash
   git clone <URL-DE-TU-REPOSITORIO>
   cd TerraformEJ1
   ```

2. **Configurar las variables locales:**
   Copia el archivo de ejemplo y ajusta los valores según tu entorno:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

3. **Inicializar Terraform:**
   Descarga los plugins necesarios del proveedor de AWS:
   ```bash
   terraform init
   ```

4. **Formatear y validar la sintaxis:**
   Verifica que el estilo y la estructura de los archivos sean correctos:
   ```bash
   terraform fmt
   terraform validate
   ```

5. **Previsualizar los cambios (Opcional - requiere credenciales AWS):**
   ```bash
   terraform plan
   ```
