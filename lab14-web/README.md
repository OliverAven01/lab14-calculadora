# 🧮 Calculadora Simple API - Lab14

API REST en .NET 9.0 que realiza operaciones matemáticas básicas.

## 🌐 Demo en Vivo

**URL de la API**: [Será proporcionada después del despliegue en Render]

## ✨ Características

- ➕ **Suma** - Suma dos números
- ➖ **Resta** - Resta dos números
- ✖️ **Multiplicación** - Multiplica dos números
- ➗ **División** - Divide dos números (con protección contra división por cero)
- 📚 **Documentación Swagger** - Interfaz interactiva para probar la API
- 🔄 **CORS Habilitado** - Puede ser consumida desde cualquier origen

## 📋 Endpoints

### GET /
Información general de la API

**Respuesta:**
```json
{
  "mensaje": "Calculadora Simple API - Lab14",
  "version": "1.0.0",
  "autor": "Oliver Aven",
  "endpoints": [
    "GET  /api/sumar?a={numero}&b={numero}",
    "GET  /api/restar?a={numero}&b={numero}",
    "GET  /api/multiplicar?a={numero}&b={numero}",
    "GET  /api/dividir?a={numero}&b={numero}",
    "POST /api/calcular"
  ],
  "documentacion": "/swagger"
}
```

### GET /api/sumar
Suma dos números

**Parámetros:**
- `a` (double): Primer número
- `b` (double): Segundo número

**Ejemplo:**
```
GET /api/sumar?a=10&b=5
```

**Respuesta:**
```json
{
  "operacion": "suma",
  "numero1": 10,
  "numero2": 5,
  "resultado": 15
}
```

### GET /api/restar
Resta dos números

**Ejemplo:**
```
GET /api/restar?a=10&b=5
```

**Respuesta:**
```json
{
  "operacion": "resta",
  "numero1": 10,
  "numero2": 5,
  "resultado": 5
}
```

### GET /api/multiplicar
Multiplica dos números

**Ejemplo:**
```
GET /api/multiplicar?a=10&b=5
```

**Respuesta:**
```json
{
  "operacion": "multiplicacion",
  "numero1": 10,
  "numero2": 5,
  "resultado": 50
}
```

### GET /api/dividir
Divide dos números

**Ejemplo:**
```
GET /api/dividir?a=10&b=5
```

**Respuesta:**
```json
{
  "operacion": "division",
  "numero1": 10,
  "numero2": 5,
  "resultado": 2
}
```

**Error (división por cero):**
```json
{
  "error": "No se puede dividir por cero",
  "operacion": "division",
  "numero1": 10,
  "numero2": 0
}
```

### POST /api/calcular
Realiza cualquier operación

**Body (JSON):**
```json
{
  "operacion": "suma",
  "numero1": 10,
  "numero2": 5
}
```

**Operaciones válidas:** `suma`, `resta`, `multiplicacion`, `division`

**Respuesta:**
```json
{
  "operacion": "suma",
  "numero1": 10,
  "numero2": 5,
  "resultado": 15
}
```

## 🚀 Despliegue en Render

### Opción 1: Desde GitHub (Recomendado)

1. Sube este proyecto a GitHub
2. Ve a [Render Dashboard](https://dashboard.render.com/)
3. Clic en **"New +"** → **"Web Service"**
4. Conecta tu repositorio de GitHub
5. Configura:
   - **Name**: `lab14-calculadora-api`
   - **Environment**: `Docker`
   - **Plan**: `Free`
6. Clic en **"Create Web Service"**
7. Render detectará el Dockerfile y desplegará automáticamente

### Opción 2: Usando render.yaml

1. Sube el proyecto con el archivo `render.yaml`
2. Ve a Render Dashboard
3. Clic en **"New +"** → **"Blueprint"**
4. Conecta tu repositorio
5. Render usará la configuración del `render.yaml`

## 💻 Desarrollo Local

### Requisitos
- .NET 9.0 SDK
- Visual Studio, Rider, o VS Code

### Ejecutar Localmente

```bash
cd lab14-web
dotnet restore
dotnet run
```

La API estará disponible en: `http://localhost:5000`

Documentación Swagger: `http://localhost:5000/swagger`

### Probar con curl

```bash
# Suma
curl "http://localhost:5000/api/sumar?a=10&b=5"

# Resta
curl "http://localhost:5000/api/restar?a=10&b=5"

# Multiplicación
curl "http://localhost:5000/api/multiplicar?a=10&b=5"

# División
curl "http://localhost:5000/api/dividir?a=10&b=5"

# POST
curl -X POST "http://localhost:5000/api/calcular" \
  -H "Content-Type: application/json" \
  -d '{"operacion":"suma","numero1":10,"numero2":5}'
```

## 🐳 Docker

### Construir la imagen
```bash
docker build -t lab14-calculadora-api .
```

### Ejecutar el contenedor
```bash
docker run -p 8080:8080 lab14-calculadora-api
```

## 📊 Tecnologías

- **Framework**: ASP.NET Core 9.0
- **Tipo**: Minimal API
- **Documentación**: Swagger/OpenAPI
- **Despliegue**: Docker + Render

## 🔧 Estructura del Proyecto

```
lab14-web/
├── Program.cs              # Código principal de la API
├── lab14-web.csproj       # Configuración del proyecto
├── Dockerfile             # Configuración de Docker
├── render.yaml            # Configuración de Render
├── README.md              # Esta documentación
└── Properties/
    └── launchSettings.json
```

## 📄 Licencia

MIT License

## 👤 Autor

Oliver Aven
- GitHub: [@OliverAven01](https://github.com/OliverAven01)
- Repositorio: [lab14-calculadora](https://github.com/OliverAven01/lab14-calculadora)

## 🙏 Agradecimientos

Proyecto creado como parte del Lab14 - Despliegue de aplicaciones .NET

---

⭐ Si te gusta este proyecto, dale una estrella en GitHub!
