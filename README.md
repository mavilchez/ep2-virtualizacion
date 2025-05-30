# ep2-virtualizacion
Evaluacion Parcial virtualizacion

# Nagios Core en Docker (Ubuntu)

Este proyecto contiene una imagen personalizada de **Nagios Core** corriendo sobre **Ubuntu 20.04** utilizando Docker. Es ideal para entornos de prueba, monitoreo básico o como base para integraciones más complejas.

---

## 📦 Contenido del repositorio

- `Dockerfile`: Define los pasos para construir la imagen Docker con Nagios Core.
- `docker-compose.yml`: Permite levantar el contenedor con un solo comando.
- `README.md`: Instrucciones de uso y despliegue.

---

## 🚀 Cómo usar este proyecto

### 1. Clonar el repositorio

```bash
git clone https://github.com/mavilchez/ep2-virtualizacion.git
cd ep2-virtualizacion

2. Construir la imagen con Docker Compose

docker-compose up --build -d

🌐 Acceder a Nagios Web

Abre tu navegador y entra a:

http://localhost:8080/nagios


🔐 Credenciales de acceso:
Usuario: nagiosadmin

Contraseña: nagiosadmin

Comandos útiles

# Detener y eliminar los contenedores
docker-compose down

# Ver el estado del contenedor
docker-compose ps

# Entrar al contenedor para revisar configuración
docker exec -it nagios bash


Notas
La imagen está basada en ubuntu:20.04.

Incluye Nagios Core 4.4.6.

No incluye plugins adicionales (pueden integrarse fácilmente).

El contenedor expone únicamente el puerto 80, accesible vía localhost:8080.


Descripción de la Evaluación

Esta evaluación tiene como objetivo medir tu capacidad para crear imágenes Docker, desplegar aplicaciones en AWS ECS y configurar servicios de monitoreo con Nagios. A través de esta actividad práctica, demostrarás tus habilidades en la gestión de contenedores, la administración de infraestructura en la nube y la implementación de herramientas de monitoreo esenciales.

Lo que debes realizar:

Creación de la Imagen Docker:

-	Redacta un archivo Dockerfile que construya una imagen Docker con Nagios Core.
-	La imagen debe incluir todas las dependencias necesarias para que Nagios funcione correctamente.
-	Configura Nagios para que inicie automáticamente al arrancar el contenedor.
-	Considera exponer el puerto 80 para acceder a la interfaz web de Nagios.
-	Construye la imagen y verifica que Nagios sea accesible localmente.
-	Sube el código del Dockerfile y otros archivos que requieras para construir la imagen a un repositorio GitHub.
-	Crea un archivo README.md en el repositorio que explique detalladamente los pasos para construir la imagen y ejecutar el contenedor.

Despliegue en AWS ECS:

-	Sube la imagen Docker creada a un repositorio de Elastic Container Registry (ECR).
-	Crea un sistema de archivos EFS y configúralo para que sea accesible desde ECS.
-	Define una tarea en ECS que utilice la imagen de Nagios del ECR.
-	Configura el montaje del EFS en el directorio principal de Nagios en cada contenedor.
-	Crea un servicio ECS con 3 tareas deseadas.
-	Configura un Application Load Balancer (ALB) para distribuir el tráfico entre las tareas.
-	Verifica que Nagios sea accesible a través de la URL del ALB.
-	Confirma que los datos de Nagios se almacenan persistentemente en el EFS.
