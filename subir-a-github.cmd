@echo off
echo ========================================
echo   Script de Subida a GitHub - Lab14
echo ========================================
echo.

REM Verificar si Git está instalado
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git no está instalado.
    echo Por favor instala Git desde: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo [1/6] Inicializando repositorio Git...
cd lab14
git init
if errorlevel 1 (
    echo Ya existe un repositorio Git
) else (
    echo Repositorio inicializado correctamente
)
echo.

echo [2/6] Agregando archivos al staging...
git add .
echo Archivos agregados
echo.

echo [3/6] Creando commit inicial...
git commit -m "Primer commit: Calculadora Simple en .NET 9.0"
if errorlevel 1 (
    echo No hay cambios para hacer commit o ya existe un commit
)
echo.

echo [4/6] Configurando rama principal...
git branch -M main
echo Rama 'main' configurada
echo.

echo ========================================
echo   IMPORTANTE: Configurar Repositorio
echo ========================================
echo.
echo Antes de continuar, necesitas:
echo 1. Ir a https://github.com
echo 2. Crear un nuevo repositorio llamado: lab14-calculadora
echo 3. NO marques "Initialize with README"
echo 4. Copia la URL del repositorio
echo.
set /p REPO_URL="Pega la URL de tu repositorio (ejemplo: https://github.com/usuario/lab14-calculadora.git): "
echo.

if "%REPO_URL%"=="" (
    echo ERROR: No ingresaste una URL
    pause
    exit /b 1
)

echo [5/6] Conectando con el repositorio remoto...
git remote add origin %REPO_URL%
if errorlevel 1 (
    echo El remoto ya existe, actualizando URL...
    git remote set-url origin %REPO_URL%
)
echo Repositorio remoto configurado
echo.

echo [6/6] Subiendo archivos a GitHub...
git push -u origin main
if errorlevel 1 (
    echo.
    echo ERROR al subir archivos.
    echo Posibles causas:
    echo - Necesitas autenticarte en GitHub
    echo - La URL del repositorio es incorrecta
    echo - No tienes permisos en el repositorio
    echo.
    echo Intenta ejecutar manualmente:
    echo git push -u origin main
    pause
    exit /b 1
)
echo.

echo ========================================
echo   SUBIDA COMPLETADA EXITOSAMENTE
echo ========================================
echo.
echo Tu proyecto ha sido subido a GitHub!
echo Puedes verlo en: %REPO_URL%
echo.
echo Proximos pasos:
echo - Visita tu repositorio en GitHub
echo - Agrega una descripcion al repositorio
echo - Crea un Release para distribuir el ejecutable
echo.
pause
