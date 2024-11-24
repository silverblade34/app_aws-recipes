# Aplicacion de recetas Kuyay Mikhuy

Este es un proyecto de Flutter que incluye una integración completa con **AWS Cognito** para la autenticación de usuarios, utilizando **AWS Amplify** como herramienta principal. La aplicación implementa las siguientes funcionalidades:

## Características principales

1. **Pantalla de inicio (Splash Screen)**  
   - Incluye animaciones con transiciones fluidas para mejorar la experiencia de usuario.

2. **Login y Registro de Usuarios**  
   - Inicio de sesión para usuarios existentes.
   - Registro de nuevos usuarios con validaciones personalizadas (contraseña segura, correos válidos, etc.).

3. **Confirmación de Registro**  
   - Los usuarios reciben un código de verificación en su correo electrónico al registrarse.
   - Funcionalidad para reenviar el código en caso de expiración.

4. **Pantalla Principal (Home)**  
   - Acceso a la funcionalidad principal de la aplicación tras una autenticación exitosa.

5. **Integración con AWS Cognito y Amplify**  
   - Uso de AWS Cognito para la gestión de usuarios (registro, confirmación, inicio de sesión).
   - Configuración mediante variables de entorno para mayor seguridad y flexibilidad.

## Requisitos previos

Antes de ejecutar el proyecto, asegúrate de tener lo siguiente:

- [Flutter instalado](https://docs.flutter.dev/get-started/install) en tu máquina.
- Una cuenta de **AWS** y un pool de usuarios configurado en Cognito.
- **Amplify CLI** configurado en tu entorno.

## Configuración del entorno

El proyecto utiliza un archivo `.env` para gestionar las credenciales de AWS Cognito. Crea un archivo `.env` en la raíz del proyecto con el siguiente contenido:

```plaintext
POOL_ID=us-east-2_NKwP2f4ee
APP_CLIENT_ID=423lbd011m0kdvt4gd3ut88m5o
```

> **Nota:** Asegúrate de no compartir este archivo públicamente o subirlo a repositorios públicos.

## Instalación

1. **Clona el repositorio:**
   ```bash
   git clone <url-del-repositorio>
   cd app_aws_recipes
   ```

2. **Instala las dependencias del proyecto:**
   ```bash
   flutter pub get
   ```

3. **Configura Amplify en el proyecto:**
   ```bash
   amplify pull
   ```

4. **Crea y configura el archivo `.env`** según la sección anterior.

5. **Corre la aplicación:**
   ```bash
   flutter run
   ```

## Recursos utilizados

- **AWS Cognito:** Gestión de autenticación y usuarios.
- **AWS Amplify:** Integración con AWS desde Flutter.
- **Flutter:** Framework para el desarrollo multiplataforma.
- **GetX:** Gestión del estado y rutas de la aplicación.
- **Flutter_dotenv:** Manejo de variables de entorno.

## Próximos pasos

- **Optimización de la experiencia de usuario:** Mejora de las transiciones y las animaciones.
- **Autenticación avanzada:** Agregar autenticación multifactor (MFA) o integración con redes sociales.
- **Mejoras en el manejo de errores:** Traducir y mapear todos los errores posibles para mayor claridad del usuario.

## Documentación adicional

- [Documentación de Flutter](https://docs.flutter.dev/)
- [AWS Amplify para Flutter](https://docs.amplify.aws/lib/q/platform/flutter/)
- [AWS Cognito](https://docs.aws.amazon.com/cognito/latest/developerguide/what-is-amazon-cognito.html)

## Créditos

Proyecto desarrollado por Michell Marcos Pacheco Tacay.