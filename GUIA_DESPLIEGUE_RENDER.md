# 🚀 Guía de Despliegue en Render - Lab14

## 📋 Parte 3: Despliegue en un Servidor (Render)

Esta guía te explica paso a paso cómo desplegar tu Calculadora API en Render.

---

## ⚠️ Nota Importante

Tu proyecto original era una **aplicación de consola**. He creado una **versión Web API** en la carpeta `lab14-web/` que puede ser desplegada en Render.

### Diferencias:
- **lab14/** - Aplicación de consola (original)
- **lab14-web/** - API REST (nueva, para desplegar en Render)

---

## 🎯 Requisitos Previos

- ✅ Cuenta de GitHub (ya tienes)
- ✅ Proyecto subido a GitHub (ya está)
- ⬜ Cuenta de Render (crearemos ahora)

---

## 📦 Paso 1: Subir la Versión Web a GitHub

Primero, necesitamos subir la nueva versión web al repositorio:

### Opción A: Usando Git desde la terminal

```bash
# Navegar a la raíz del proyecto
cd C:\Users\Asus\RiderProjects\lab14

# Agregar los nuevos archivos
git add lab14-web/
git add GUIA_DESPLIEGUE_RENDER.md

# Hacer commit
git commit -m "Agregar versión Web API para despliegue en Render"

# Subir a GitHub
git push origin main
```

### Opción B: Usando el script

He actualizado el proyecto. Ejecuta:
```bash
git add .
git commit -m "Agregar versión Web API para Render"
git push
```

---

## 🌐 Paso 2: Crear Cuenta en Render

1. Ve a: **https://render.com**
2. Haz clic en **"Get Started"** o **"Sign Up"**
3. Opciones de registro:
   - **Con GitHub** (Recomendado) - Clic en "Sign up with GitHub"
   - Con Google
   - Con email
4. Si eliges GitHub:
   - Autoriza a Render para acceder a tus repositorios
   - Acepta los permisos solicitados
5. Completa tu perfil si es necesario

---

## 🔗 Paso 3: Conectar Repositorio de GitHub

### 3.1 Desde el Dashboard de Render

1. Una vez dentro, verás el **Dashboard**
2. Haz clic en el botón **"New +"** (arriba a la derecha)
3. Selecciona **"Web Service"**

### 3.2 Conectar GitHub

1. Si es tu primera vez, haz clic en **"Connect GitHub"**
2. Autoriza a Render para acceder a tus repositorios
3. Puedes elegir:
   - **All repositories** - Render puede ver todos tus repos
   - **Only select repositories** - Solo repos específicos (Recomendado)
4. Si eliges "Only select repositories":
   - Selecciona: `lab14-calculadora`
   - Haz clic en "Install"

### 3.3 Seleccionar el Repositorio

1. Busca tu repositorio: **`OliverAven01/lab14-calculadora`**
2. Haz clic en **"Connect"** junto al repositorio

---

## ⚙️ Paso 4: Configurar el Proyecto

Render te mostrará un formulario de configuración:

### 4.1 Configuración Básica

**Name:**
```
lab14-calculadora-api
```
(Este será parte de tu URL: `lab14-calculadora-api.onrender.com`)

**Region:**
```
Oregon (US West)
```
(O la región más cercana a ti)

**Branch:**
```
main
```

**Root Directory:**
```
lab14-web
```
⚠️ **MUY IMPORTANTE**: Especifica `lab14-web` porque la API está en esa carpeta

### 4.2 Configuración de Build

**Environment:**
```
Docker
```

Render detectará automáticamente el `Dockerfile` en la carpeta `lab14-web/`

### 4.3 Plan

**Instance Type:**
```
Free
```

El plan gratuito incluye:
- 750 horas/mes
- 512 MB RAM
- Se duerme después de 15 minutos de inactividad
- Tarda ~30 segundos en despertar

### 4.4 Variables de Entorno (Opcional)

Render configurará automáticamente:
- `PORT` - Puerto dinámico
- `ASPNETCORE_ENVIRONMENT` - Production

No necesitas agregar nada más por ahora.

---

## 🚀 Paso 5: Desplegar

1. Revisa toda la configuración
2. Haz clic en el botón **"Create Web Service"** (abajo)
3. Render comenzará el proceso de despliegue:
   - ⏳ Clonando el repositorio
   - ⏳ Construyendo la imagen Docker
   - ⏳ Desplegando el contenedor
   - ⏳ Iniciando la aplicación

Este proceso toma aproximadamente **5-10 minutos** la primera vez.

---

## ✅ Paso 6: Verificar el Despliegue

### 6.1 Monitorear el Progreso

En la página del servicio verás:
- **Logs** - Muestra el progreso en tiempo real
- **Events** - Historial de eventos
- **Status** - Estado actual (Building → Deploying → Live)

### 6.2 Esperar a que esté "Live"

Cuando veas:
```
✓ Your service is live 🎉
```

Tu API está lista.

### 6.3 Obtener la URL

Render te proporcionará una URL como:
```
https://lab14-calculadora-api.onrender.com
```

---

## 🧪 Paso 7: Probar la API

### 7.1 Probar en el Navegador

Abre tu navegador y visita:

**Página principal:**
```
https://lab14-calculadora-api.onrender.com
```

Deberías ver:
```json
{
  "mensaje": "Calculadora Simple API - Lab14",
  "version": "1.0.0",
  "autor": "Oliver Aven",
  "endpoints": [...]
}
```

**Documentación Swagger:**
```
https://lab14-calculadora-api.onrender.com/swagger
```

### 7.2 Probar los Endpoints

**Suma:**
```
https://lab14-calculadora-api.onrender.com/api/sumar?a=10&b=5
```

**Resta:**
```
https://lab14-calculadora-api.onrender.com/api/restar?a=20&b=8
```

**Multiplicación:**
```
https://lab14-calculadora-api.onrender.com/api/multiplicar?a=7&b=6
```

**División:**
```
https://lab14-calculadora-api.onrender.com/api/dividir?a=100&b=4
```

### 7.3 Probar con curl (Opcional)

```bash
# Suma
curl "https://lab14-calculadora-api.onrender.com/api/sumar?a=10&b=5"

# POST
curl -X POST "https://lab14-calculadora-api.onrender.com/api/calcular" \
  -H "Content-Type: application/json" \
  -d '{"operacion":"suma","numero1":15,"numero2":25}'
```

### 7.4 Probar con Postman (Opcional)

1. Abre Postman
2. Crea una nueva request
3. Método: `GET`
4. URL: `https://lab14-calculadora-api.onrender.com/api/sumar?a=10&b=5`
5. Clic en "Send"

---

## 📊 Paso 8: Monitorear y Administrar

### 8.1 Dashboard de Render

En el dashboard puedes ver:
- **Metrics** - Uso de CPU, memoria, requests
- **Logs** - Logs en tiempo real de tu aplicación
- **Events** - Historial de despliegues
- **Settings** - Configuración del servicio

### 8.2 Logs en Tiempo Real

Para ver los logs:
1. Ve a tu servicio en Render
2. Haz clic en la pestaña **"Logs"**
3. Verás todas las requests y respuestas

### 8.3 Redesplegar

Si haces cambios en tu código:
1. Haz commit y push a GitHub
2. Render detectará los cambios automáticamente
3. Iniciará un nuevo despliegue

O manualmente:
1. Ve a tu servicio en Render
2. Haz clic en **"Manual Deploy"** → **"Deploy latest commit"**

---

## 🎓 Configuración Avanzada (Opcional)

### Custom Domain

Si tienes un dominio propio:
1. Ve a **Settings** → **Custom Domain**
2. Agrega tu dominio
3. Configura los DNS según las instrucciones

### Variables de Entorno

Para agregar variables:
1. Ve a **Environment** → **Environment Variables**
2. Haz clic en **"Add Environment Variable"**
3. Agrega `Key` y `Value`
4. Guarda y redesplega

### Health Checks

Render hace health checks automáticos a `/`

Para personalizar:
1. Ve a **Settings** → **Health Check Path**
2. Cambia la ruta si es necesario

---

## 📋 Resumen de URLs

Después del despliegue tendrás:

| Recurso | URL |
|---------|-----|
| API Principal | `https://lab14-calculadora-api.onrender.com` |
| Swagger Docs | `https://lab14-calculadora-api.onrender.com/swagger` |
| Suma | `https://lab14-calculadora-api.onrender.com/api/sumar?a=X&b=Y` |
| Resta | `https://lab14-calculadora-api.onrender.com/api/restar?a=X&b=Y` |
| Multiplicar | `https://lab14-calculadora-api.onrender.com/api/multiplicar?a=X&b=Y` |
| Dividir | `https://lab14-calculadora-api.onrender.com/api/dividir?a=X&b=Y` |

---

## ❓ Solución de Problemas

### Error: "Build failed"

**Causa**: Problema con el Dockerfile o dependencias

**Solución**:
1. Revisa los logs de build
2. Verifica que el `Root Directory` sea `lab14-web`
3. Asegúrate de que el Dockerfile esté en `lab14-web/`

### Error: "Application failed to start"

**Causa**: Puerto incorrecto o error en el código

**Solución**:
1. Verifica los logs de la aplicación
2. Asegúrate de que la app escuche en el puerto `$PORT`
3. El Dockerfile debe exponer el puerto 8080

### La API está "Sleeping"

**Causa**: Plan gratuito duerme después de 15 min de inactividad

**Solución**:
- Es normal en el plan gratuito
- La primera request tardará ~30 segundos
- Considera actualizar al plan Starter ($7/mes) para mantenerla activa

### No puedo ver mi repositorio

**Causa**: Permisos de GitHub

**Solución**:
1. Ve a GitHub → Settings → Applications
2. Busca "Render"
3. Otorga acceso al repositorio

---

## 🎯 Checklist Final

Antes de considerar completado el despliegue:

- [ ] Cuenta de Render creada
- [ ] Repositorio conectado
- [ ] Servicio configurado con `Root Directory: lab14-web`
- [ ] Environment: Docker
- [ ] Despliegue completado (Status: Live)
- [ ] URL de la API obtenida
- [ ] Endpoint raíz probado (/)
- [ ] Swagger funcionando (/swagger)
- [ ] Al menos un endpoint de cálculo probado
- [ ] Logs revisados sin errores

---

## 📸 Capturas Recomendadas

Para tu documentación/reporte, toma capturas de:
1. Dashboard de Render mostrando el servicio "Live"
2. Página principal de la API (JSON de bienvenida)
3. Swagger UI funcionando
4. Resultado de una operación (ej: suma)
5. Logs mostrando requests exitosas

---

## 🎉 ¡Felicidades!

Has completado exitosamente las 3 partes del Lab14:

1. ✅ **Publicación** - Archivos publicados localmente
2. ✅ **GitHub** - Código subido al repositorio
3. ✅ **Render** - API desplegada en la nube

Tu API está ahora disponible públicamente en internet y puede ser consumida desde cualquier aplicación.

---

## 📞 Recursos Adicionales

- **Documentación de Render**: https://render.com/docs
- **Render Status**: https://status.render.com/
- **Comunidad de Render**: https://community.render.com/
- **Pricing de Render**: https://render.com/pricing

---

**Autor**: Oliver Aven  
**Repositorio**: https://github.com/OliverAven01/lab14-calculadora  
**Fecha**: Noviembre 2025
