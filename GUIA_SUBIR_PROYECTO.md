# Guía para Subir tu Proyecto .NET Publicado

## 🎯 Opciones para Subir tu Proyecto

Tienes varias opciones para compartir o desplegar tu aplicación publicada:

1. **GitHub** - Para compartir el código fuente
2. **GitHub Releases** - Para distribuir el ejecutable
3. **Azure App Service** - Para hosting en la nube
4. **Servidor FTP** - Para hosting tradicional
5. **Compartir Localmente** - ZIP o carpeta compartida

---

## 📦 Opción 1: Subir a GitHub (Código Fuente)

### Paso 1: Inicializar Git en tu Proyecto
```cmd
cd lab14
git init
```

### Paso 2: Crear archivo .gitignore
Crea un archivo `.gitignore` para excluir archivos innecesarios:
```
bin/
obj/
publish/
*.user
*.suo
.vs/
```

### Paso 3: Hacer el Primer Commit
```cmd
git add .
git commit -m "Primer commit: Calculadora Simple en .NET"
```

### Paso 4: Crear Repositorio en GitHub
1. Ve a https://github.com
2. Haz clic en el botón **"+"** → **"New repository"**
3. Nombre del repositorio: `lab14-calculadora`
4. Descripción: "Calculadora simple en C# .NET 9.0"
5. Selecciona **Public** o **Private**
6. NO marques "Initialize with README" (ya tienes código)
7. Haz clic en **"Create repository"**

### Paso 5: Conectar y Subir
```cmd
git remote add origin https://github.com/TU_USUARIO/lab14-calculadora.git
git branch -M main
git push -u origin main
```

---

## 🚀 Opción 2: GitHub Releases (Distribuir Ejecutable)

### Paso 1: Preparar el Paquete
Primero, crea un ZIP con los archivos publicados:
```cmd
cd lab14
powershell Compress-Archive -Path publish\* -DestinationPath lab14-v1.0.0-win-x64.zip
```

### Paso 2: Crear un Release en GitHub
1. Ve a tu repositorio en GitHub
2. Haz clic en **"Releases"** (lado derecho)
3. Haz clic en **"Create a new release"**
4. Tag version: `v1.0.0`
5. Release title: `Calculadora Simple v1.0.0`
6. Descripción:
```markdown
## Calculadora Simple en .NET 9.0

### Características
- ✅ Suma, resta, multiplicación y división
- ✅ Interfaz de consola interactiva
- ✅ Validación de entrada

### Requisitos
- Windows 10/11
- .NET 9.0 Runtime instalado

### Instalación
1. Descarga el archivo ZIP
2. Extrae en cualquier carpeta
3. Ejecuta `lab14.exe`

### Descarga
[lab14-v1.0.0-win-x64.zip](enlace)
```
7. Arrastra el archivo ZIP a la sección **"Attach binaries"**
8. Haz clic en **"Publish release"**

---

## ☁️ Opción 3: Subir a Azure App Service (Desde Rider)

### Paso 1: Configurar Azure en Rider
1. Abre Rider
2. Ve a **File** → **Settings** → **Plugins**
3. Busca e instala **"Azure Toolkit for Rider"**
4. Reinicia Rider

### Paso 2: Iniciar Sesión en Azure
1. Ve a **Tools** → **Azure** → **Sign In**
2. Ingresa tus credenciales de Azure
3. Selecciona tu suscripción

### Paso 3: Publicar a Azure
1. Clic derecho en el proyecto `lab14`
2. Selecciona **Publish**
3. Elige **Azure** como destino
4. Selecciona **Azure App Service (Windows)**
5. Haz clic en **"Create New"**
6. Configura:
   - **Name**: lab14-calculadora
   - **Subscription**: Tu suscripción
   - **Resource Group**: Crear nuevo o usar existente
   - **Hosting Plan**: Selecciona un plan (Free tier disponible)
7. Haz clic en **Create**
8. Haz clic en **Publish**

### Paso 4: Verificar el Despliegue
1. Espera a que termine la publicación
2. Rider te mostrará la URL de tu aplicación
3. Visita la URL para verificar

---

## 📁 Opción 4: Subir por FTP (Hosting Tradicional)

### Paso 1: Configurar FTP en Rider
1. Clic derecho en el proyecto `lab14`
2. Selecciona **Publish**
3. Elige **FTP** como destino
4. Ingresa los datos de tu servidor:
   - **Server**: ftp.tuservidor.com
   - **Port**: 21 (o 22 para SFTP)
   - **Username**: tu_usuario
   - **Password**: tu_contraseña
   - **Remote Path**: /public_html o /www

### Paso 2: Publicar
1. Haz clic en **Test Connection** para verificar
2. Si la conexión es exitosa, haz clic en **Publish**
3. Rider subirá todos los archivos al servidor

### Paso 3: Verificar
1. Conéctate a tu servidor por FTP
2. Verifica que todos los archivos estén presentes
3. Configura los permisos si es necesario

---

## 📤 Opción 5: Compartir Localmente

### Método A: Crear un ZIP
```cmd
cd lab14
powershell Compress-Archive -Path publish\* -DestinationPath Calculadora-Lab14.zip
```

Ahora puedes compartir `Calculadora-Lab14.zip` por:
- Email
- Google Drive
- Dropbox
- OneDrive
- USB

### Método B: Carpeta Compartida en Red
1. Copia la carpeta `publish` a una ubicación de red
2. Comparte la carpeta con permisos de lectura
3. Los usuarios pueden ejecutar `lab14.exe` directamente

---

## 🔧 Publicación Avanzada: Archivo Único Auto-Contenido

Si quieres crear un ejecutable que NO requiera .NET instalado:

### Paso 1: Publicar como Self-Contained
```cmd
cd lab14
dotnet publish -c Release -r win-x64 --self-contained true -p:PublishSingleFile=true -o publish-standalone
```

### Paso 2: Verificar el Resultado
```cmd
dir publish-standalone
```

Deberías ver un solo archivo `lab14.exe` de mayor tamaño (~70MB) que incluye todo el runtime de .NET.

### Paso 3: Distribuir
Este ejecutable puede ejecutarse en cualquier Windows sin necesidad de instalar .NET.

---

## 📋 Checklist Antes de Subir

Antes de publicar o compartir tu aplicación, verifica:

- [ ] El proyecto compila sin errores
- [ ] La aplicación funciona correctamente en modo Release
- [ ] Has probado el ejecutable publicado
- [ ] Has incluido un archivo README con instrucciones
- [ ] Has especificado los requisitos del sistema
- [ ] Has creado un .gitignore apropiado (si usas Git)
- [ ] Has eliminado información sensible del código
- [ ] Has actualizado la versión en el archivo .csproj

---

## 📝 Crear un README para tu Proyecto

Crea un archivo `README.md` en la raíz del proyecto:

```markdown
# Calculadora Simple - Lab14

Aplicación de consola en C# que realiza operaciones matemáticas básicas.

## Características
- Suma
- Resta
- Multiplicación
- División (con protección contra división por cero)

## Requisitos
- Windows 10/11
- .NET 9.0 Runtime

## Instalación
1. Descarga el proyecto
2. Extrae los archivos
3. Ejecuta `lab14.exe`

## Uso
1. Selecciona una operación (1-5)
2. Ingresa los números cuando se solicite
3. Ve el resultado
4. Repite o selecciona 5 para salir

## Desarrollo
```bash
# Compilar
dotnet build

# Ejecutar
dotnet run

# Publicar
dotnet publish -c Release
```

## Licencia
MIT License
```

---

## 🎓 Resumen de Comandos Útiles

```cmd
# Inicializar Git
git init

# Agregar archivos
git add .

# Hacer commit
git commit -m "Mensaje"

# Conectar con GitHub
git remote add origin URL_DEL_REPO

# Subir cambios
git push -u origin main

# Publicar proyecto
dotnet publish -c Release

# Crear ZIP
powershell Compress-Archive -Path publish\* -DestinationPath app.zip

# Ver archivos publicados
dir publish
```

---

## ❓ Preguntas Frecuentes

**P: ¿Necesito subir la carpeta `publish`?**
R: No, generalmente solo subes el código fuente. Los usuarios pueden compilar y publicar ellos mismos.

**P: ¿Cómo comparto solo el ejecutable?**
R: Usa GitHub Releases o crea un ZIP de la carpeta `publish`.

**P: ¿Puedo subir a múltiples plataformas?**
R: Sí, puedes tener el código en GitHub y el ejecutable en Releases simultáneamente.

**P: ¿Qué archivos NO debo subir a Git?**
R: No subas `bin/`, `obj/`, `publish/`, `.vs/`, archivos `.user` o `.suo`.

---

## 🎯 Próximos Pasos

1. Elige la opción que mejor se adapte a tus necesidades
2. Sigue los pasos correspondientes
3. Verifica que todo funcione correctamente
4. Comparte el enlace o archivo con otros

¡Tu proyecto está listo para ser compartido con el mundo! 🚀
