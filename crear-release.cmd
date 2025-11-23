@echo off
echo ========================================
echo   Crear Paquete para GitHub Release
echo ========================================
echo.

echo [1/3] Verificando carpeta de publicacion...
if not exist "lab14\publish" (
    echo ERROR: No existe la carpeta 'publish'
    echo Primero debes publicar el proyecto con:
    echo dotnet publish lab14/lab14.csproj -c Release -o lab14/publish
    pause
    exit /b 1
)
echo Carpeta encontrada
echo.

echo [2/3] Creando archivo ZIP...
set VERSION=1.0.0
set FILENAME=lab14-v%VERSION%-win-x64.zip

if exist "%FILENAME%" (
    echo Eliminando ZIP anterior...
    del "%FILENAME%"
)

powershell -Command "Compress-Archive -Path 'lab14\publish\*' -DestinationPath '%FILENAME%'"
if errorlevel 1 (
    echo ERROR al crear el archivo ZIP
    pause
    exit /b 1
)
echo.

echo [3/3] Verificando archivo creado...
if exist "%FILENAME%" (
    echo ========================================
    echo   PAQUETE CREADO EXITOSAMENTE
    echo ========================================
    echo.
    echo Archivo: %FILENAME%
    for %%A in ("%FILENAME%") do echo Tamano: %%~zA bytes
    echo.
    echo Proximos pasos:
    echo 1. Ve a tu repositorio en GitHub
    echo 2. Haz clic en "Releases" ^> "Create a new release"
    echo 3. Tag version: v%VERSION%
    echo 4. Release title: Calculadora Simple v%VERSION%
    echo 5. Arrastra el archivo %FILENAME% a la seccion de archivos
    echo 6. Haz clic en "Publish release"
    echo.
) else (
    echo ERROR: No se pudo crear el archivo ZIP
)

pause
