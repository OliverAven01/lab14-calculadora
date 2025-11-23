# Guía de Publicación de Proyecto .NET en Rider

## 📋 Proyecto Creado
He creado una **Calculadora Simple** en C# que permite realizar operaciones matemáticas básicas.

---

## 🚀 Parte 1: Publicación de Archivos de un Proyecto .NET en Rider

### Paso 1: Abrir Rider y el Proyecto .NET
1. **Abre Rider** en tu computadora
2. Ve a `File > Open` y selecciona la carpeta `lab14.sln`
3. Espera a que Rider cargue el proyecto completamente

### Paso 2: Configurar la Publicación
1. En el **Solution Explorer** (panel izquierdo), localiza el proyecto `lab14`
2. Haz **clic derecho** sobre el proyecto `lab14`
3. Selecciona **Publish** desde el menú contextual
   - Si no ves esta opción, busca **Publish to Folder** o ve a `Build > Publish lab14`

### Paso 3: Seleccionar el Destino de Publicación
1. Aparecerá la ventana de **Publish**
2. Selecciona **Folder** como destino para la publicación
   - Otras opciones disponibles: Azure, Docker, FTP, etc.
3. Configuraciones importantes:
   - **Target Framework**: Asegúrate de que esté seleccionado `.NET 9.0` (o el que uses)
   - **Configuration**: Selecciona **Release** (optimizado para producción)
   - **Target Runtime**: Puedes dejarlo en "Portable" o seleccionar un sistema específico

### Paso 4: Configurar la Carpeta de Publicación
1. En el campo **Folder** o **Target Location**, haz clic en el botón de explorar (...)
2. Selecciona o crea una carpeta donde se guardarán los archivos publicados
   - Ejemplo: `C:\Users\TuUsuario\Desktop\lab14-publicado`
   - O usa la carpeta por defecto: `lab14\bin\Release\net9.0\publish`

### Paso 5: Publicar el Proyecto
1. Revisa todas las configuraciones
2. Haz clic en el botón **Publish** (generalmente en la parte inferior)
3. Rider comenzará el proceso:
   - Compilación del proyecto
   - Optimización del código
   - Copia de archivos necesarios
4. Espera a que aparezca el mensaje "Publish succeeded"

### Paso 6: Verificación de los Archivos Publicados
1. Navega hasta la carpeta seleccionada en tu explorador de archivos
2. Deberías ver los siguientes archivos:
   - **lab14.exe** - Ejecutable principal (Windows)
   - **lab14.dll** - Biblioteca compilada
   - **lab14.deps.json** - Dependencias del proyecto
   - **lab14.runtimeconfig.json** - Configuración del runtime
   - **lab14.pdb** - Símbolos de depuración (opcional)

---

## ✅ Verificación Rápida

### Probar la Aplicación Publicada
1. Abre la carpeta de publicación
2. Haz doble clic en `lab14.exe`
3. Deberías ver la calculadora funcionando en la consola

### Desde la Terminal (Alternativa)
```cmd
cd lab14\publish
lab14.exe
```

---

## 📦 Archivos Generados Explicados

| Archivo | Descripción |
|---------|-------------|
| `lab14.exe` | Ejecutable principal de la aplicación |
| `lab14.dll` | Código compilado de tu aplicación |
| `lab14.deps.json` | Lista de dependencias y versiones |
| `lab14.runtimeconfig.json` | Configuración del runtime de .NET |
| `lab14.pdb` | Símbolos de depuración (opcional) |

---

## 🎯 Opciones Adicionales de Publicación

### Publicación Auto-Contenida (Self-Contained)
Si quieres que la aplicación incluya el runtime de .NET:
```cmd
dotnet publish -c Release --self-contained true -r win-x64
```

### Publicación como Archivo Único
Para generar un solo ejecutable:
```cmd
dotnet publish -c Release -p:PublishSingleFile=true --self-contained true -r win-x64
```

---

## 💡 Consejos Importantes

1. **Siempre usa Configuration: Release** para publicación en producción
2. **Verifica el Target Framework** antes de publicar
3. **Prueba el ejecutable** antes de distribuirlo
4. **Incluye el runtime** si no estás seguro de que el usuario tenga .NET instalado
5. **Documenta los requisitos** del sistema para tu aplicación

---

## 🔧 Comandos Útiles desde Terminal

```cmd
# Compilar el proyecto
dotnet build lab14/lab14.csproj

# Publicar en modo Release
dotnet publish lab14/lab14.csproj -c Release -o lab14/publish

# Ejecutar la aplicación publicada
lab14\publish\lab14.exe
```

---

## ✨ Tu Proyecto Está Listo

La aplicación de calculadora ha sido publicada exitosamente en la carpeta `lab14/publish`.
Puedes distribuir esta carpeta completa o crear un instalador para facilitar la distribución.
