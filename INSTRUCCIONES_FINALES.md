# 🎯 Instrucciones Finales - Lab14

## ✅ Todo Está Listo para Subir

He preparado todo lo necesario para que puedas subir tu proyecto fácilmente. Aquí está el resumen completo:

---

## 📁 Archivos Creados

### Documentación
- ✅ **GUIA_PUBLICACION.md** - Cómo publicar en Rider (Parte 1 completada)
- ✅ **GUIA_SUBIR_PROYECTO.md** - Guía completa para subir (5 opciones)
- ✅ **PASOS_RAPIDOS.txt** - Referencia rápida visual
- ✅ **RESUMEN_PROYECTO.txt** - Resumen del proyecto
- ✅ **Este archivo** - Instrucciones finales

### Proyecto
- ✅ **lab14/Program.cs** - Código de la calculadora
- ✅ **lab14/lab14.csproj** - Configuración del proyecto
- ✅ **lab14/README.md** - Documentación del proyecto
- ✅ **lab14/.gitignore** - Archivos a ignorar en Git
- ✅ **lab14/publish/** - Archivos publicados listos

### Scripts Automáticos
- ✅ **subir-a-github.cmd** - Script para subir a GitHub automáticamente
- ✅ **crear-release.cmd** - Script para crear paquete ZIP

---

## 🚀 Cómo Subir tu Proyecto (3 Pasos Simples)

### Paso 1: Crear Repositorio en GitHub (2 minutos)

1. Abre tu navegador y ve a: **https://github.com**
2. Haz clic en el botón **"+"** (arriba a la derecha) → **"New repository"**
3. Configura el repositorio:
   - **Repository name**: `lab14-calculadora`
   - **Description**: "Calculadora simple en C# .NET 9.0"
   - **Visibility**: Public (o Private si prefieres)
   - ⚠️ **NO marques** "Initialize this repository with a README"
4. Haz clic en **"Create repository"**
5. **Copia la URL** que aparece (ejemplo: `https://github.com/tu-usuario/lab14-calculadora.git`)

### Paso 2: Ejecutar el Script Automático (1 minuto)

1. En tu explorador de archivos, busca el archivo: **`subir-a-github.cmd`**
2. Haz **doble clic** en el archivo
3. Se abrirá una ventana de comandos
4. Cuando te pida la URL, **pega** la URL que copiaste en el Paso 1
5. Presiona **Enter**
6. Espera a que termine (verás "SUBIDA COMPLETADA EXITOSAMENTE")

### Paso 3: Verificar (30 segundos)

1. Ve a tu repositorio en GitHub (la URL que copiaste)
2. Deberías ver todos tus archivos
3. ¡Listo! Tu proyecto está en GitHub 🎉

---

## 📦 Bonus: Crear un Release (Opcional)

Si quieres que otros descarguen tu aplicación sin compilar:

### Paso 1: Crear el Paquete
1. Haz **doble clic** en: **`crear-release.cmd`**
2. Se creará el archivo: `lab14-v1.0.0-win-x64.zip`

### Paso 2: Subir a GitHub Releases
1. Ve a tu repositorio en GitHub
2. Haz clic en **"Releases"** (lado derecho)
3. Haz clic en **"Create a new release"**
4. Configura:
   - **Tag version**: `v1.0.0`
   - **Release title**: `Calculadora Simple v1.0.0`
   - **Description**: 
     ```
     ## Calculadora Simple en .NET 9.0
     
     ### Características
     - ✅ Suma, resta, multiplicación y división
     - ✅ Interfaz de consola interactiva
     - ✅ Validación de entrada
     
     ### Requisitos
     - Windows 10/11
     - .NET 9.0 Runtime
     
     ### Instalación
     1. Descarga el archivo ZIP
     2. Extrae en cualquier carpeta
     3. Ejecuta `lab14.exe`
     ```
5. Arrastra el archivo `lab14-v1.0.0-win-x64.zip` a la sección de archivos
6. Haz clic en **"Publish release"**

---

## 🎓 Explicación Paso a Paso (Para Entender Qué Hace)

### ¿Qué es Git?
Git es un sistema de control de versiones que guarda el historial de cambios de tu código.

### ¿Qué es GitHub?
GitHub es una plataforma en la nube donde puedes almacenar y compartir tus proyectos Git.

### ¿Qué hace el script `subir-a-github.cmd`?

```cmd
1. git init
   → Inicializa un repositorio Git en tu carpeta lab14

2. git add .
   → Agrega todos los archivos al "staging area"

3. git commit -m "mensaje"
   → Guarda los cambios con un mensaje descriptivo

4. git branch -M main
   → Renombra la rama principal a "main"

5. git remote add origin URL
   → Conecta tu repositorio local con GitHub

6. git push -u origin main
   → Sube todos los archivos a GitHub
```

### ¿Qué hace el script `crear-release.cmd`?

```cmd
1. Verifica que existe la carpeta publish/
2. Crea un archivo ZIP con todos los archivos publicados
3. Lo nombra con la versión: lab14-v1.0.0-win-x64.zip
```

---

## 🔧 Alternativa: Usar Rider (Sin Scripts)

Si prefieres usar Rider en lugar de los scripts:

### Configurar Git en Rider

1. Abre Rider
2. Ve a **VCS** → **Enable Version Control Integration**
3. Selecciona **Git**
4. Haz clic en **OK**

### Hacer el Primer Commit

1. Ve a **VCS** → **Commit** (o presiona `Ctrl+K`)
2. Selecciona todos los archivos en la lista
3. En "Commit Message" escribe: `Primer commit: Calculadora Simple`
4. Haz clic en **Commit**

### Conectar con GitHub

1. Ve a **VCS** → **Git** → **Remotes**
2. Haz clic en el botón **"+"**
3. Name: `origin`
4. URL: Pega la URL de tu repositorio de GitHub
5. Haz clic en **OK**

### Subir a GitHub

1. Ve a **VCS** → **Git** → **Push** (o presiona `Ctrl+Shift+K`)
2. Verifica que la rama sea `main`
3. Haz clic en **Push**
4. Si te pide autenticación, ingresa tus credenciales de GitHub

### Publicar desde Rider (Alternativa Avanzada)

1. Clic derecho en el proyecto `lab14`
2. Selecciona **Publish**
3. Elige el destino:
   - **Folder** - Para publicar localmente
   - **Azure** - Para subir a Azure
   - **FTP** - Para subir a un servidor
4. Configura las opciones
5. Haz clic en **Publish**

---

## 📋 Checklist Final

Antes de subir, verifica:

- [ ] El proyecto compila sin errores
- [ ] La aplicación funciona correctamente
- [ ] Has probado el ejecutable en `lab14/publish/`
- [ ] Has creado el repositorio en GitHub
- [ ] Tienes la URL del repositorio copiada
- [ ] Git está instalado en tu computadora

---

## ❓ Preguntas Frecuentes

### ¿Necesito instalar algo?

Sí, necesitas tener **Git** instalado:
- Descarga desde: https://git-scm.com/download/win
- Instala con las opciones por defecto
- Reinicia tu computadora

### ¿Qué archivos se suben a GitHub?

Se suben:
- ✅ Código fuente (Program.cs)
- ✅ Configuración del proyecto (lab14.csproj)
- ✅ Documentación (README.md)
- ✅ Configuración de Git (.gitignore)

NO se suben (gracias al .gitignore):
- ❌ Carpeta `bin/`
- ❌ Carpeta `obj/`
- ❌ Carpeta `publish/`
- ❌ Archivos temporales

### ¿Puedo subir el ejecutable también?

Sí, pero NO directamente en el repositorio. Usa **GitHub Releases**:
1. Ejecuta `crear-release.cmd`
2. Sube el ZIP en la sección de Releases

### ¿Qué pasa si me equivoco?

No te preocupes, puedes:
- Hacer más commits con correcciones
- Eliminar el repositorio en GitHub y empezar de nuevo
- Usar `git reset` para deshacer cambios locales

### ¿Cómo actualizo el proyecto después?

```cmd
cd lab14
git add .
git commit -m "Descripción de los cambios"
git push
```

O desde Rider:
1. VCS → Commit (Ctrl+K)
2. VCS → Push (Ctrl+Shift+K)

---

## 🎯 Resumen Ultra Rápido

```
1. Crear repo en GitHub → Copiar URL
2. Doble clic en: subir-a-github.cmd
3. Pegar URL cuando se solicite
4. ¡Listo! 🎉
```

---

## 📞 Si Tienes Problemas

### Error: "git no se reconoce"
**Solución**: Instala Git desde https://git-scm.com/download/win

### Error: "Authentication failed"
**Solución**: 
1. Ve a GitHub → Settings → Developer settings → Personal access tokens
2. Genera un nuevo token
3. Úsalo como contraseña cuando Git te lo pida

### Error: "remote origin already exists"
**Solución**:
```cmd
cd lab14
git remote remove origin
git remote add origin TU_URL
git push -u origin main
```

### El script no funciona
**Solución**: Usa los comandos manuales desde CMD:
```cmd
cd lab14
git init
git add .
git commit -m "Primer commit"
git branch -M main
git remote add origin TU_URL
git push -u origin main
```

---

## 🎊 ¡Felicidades!

Una vez que subas tu proyecto, podrás:
- ✅ Compartir el enlace con otros
- ✅ Trabajar desde cualquier computadora
- ✅ Tener un respaldo en la nube
- ✅ Mostrar tu trabajo en tu portafolio
- ✅ Colaborar con otros desarrolladores

---

## 📚 Recursos Adicionales

- **Documentación de Git**: https://git-scm.com/doc
- **Guías de GitHub**: https://guides.github.com/
- **Markdown Guide**: https://www.markdownguide.org/
- **.NET Documentation**: https://docs.microsoft.com/dotnet/

---

**¿Listo para empezar?** 

👉 Abre **PASOS_RAPIDOS.txt** para una referencia visual rápida

👉 O ejecuta **subir-a-github.cmd** para empezar ahora mismo

¡Éxito con tu proyecto! 🚀
