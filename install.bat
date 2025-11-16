@echo off
REM Script de Instalación para Windows
REM THO DM ALL DISCORD - Bot Discord Multi-Instancia

color 0B
cls
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║         THO DM ALL DISCORD - Instalador para Windows       ║
echo ║                 Bot Discord Multi-Instancia                ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Verificar si Node.js está instalado
node --version >nul 2>&1
if errorlevel 1 (
    color 0C
    echo [ERROR] Node.js no está instalado o no está en el PATH
    echo.
    echo Por favor, descarga e instala Node.js desde: https://nodejs.org/
    echo 1. Descarga la versión LTS (v18 o superior)
    echo 2. Ejecuta el instalador
    echo 3. Asegúrate de marcar "Add to PATH" durante la instalación
    echo 4. Reinicia tu terminal y vuelve a ejecutar este script
    echo.
    pause
    exit /b 1
)

echo [OK] Node.js detectado
node --version
echo.

REM Verificar si npm está instalado
npm --version >nul 2>&1
if errorlevel 1 (
    color 0C
    echo [ERROR] npm no está instalado
    pause
    exit /b 1
)

echo [OK] npm detectado
npm --version
echo.

REM Cambiar a la carpeta de assets del script
cd /d "%~dp0"

REM Instalar dependencias
echo [*] Instalando dependencias con npm...
echo.
call npm install

if errorlevel 1 (
    color 0C
    echo.
    echo [ERROR] Error durante la instalación de dependencias
    echo.
    pause
    exit /b 1
)

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║           ✅ Instalación Completada Exitosamente          ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo [PASOS SIGUIENTES]
echo.
echo 1. Edita el archivo: assest/node.js
echo    Busca la línea: const ADMIN_BOT_TOKEN = 'EL_TOKEN_DEL_BOT_ADMIN_AQUI';
echo    Reemplázala con tu token de bot admin
echo.
echo 2. Edita el archivo: tokens.txt
echo    Agrega los tokens de tus bots trabajadores (uno por línea)
echo.
echo 3. Ejecuta el script: start.bat
echo    O ejecuta: npm start
echo.
echo [VERIFICACIÓN]
echo Token válido debe tener formato: MTQxNDAx...resto_del_token
echo.
pause
