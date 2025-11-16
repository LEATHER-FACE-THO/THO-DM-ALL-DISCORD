@echo off
REM Script Mejorado de Ejecución para Windows
REM THO DM ALL DISCORD - Bot Discord Multi-Instancia
REM Este script mantiene los bots activos permanentemente

setlocal enabledelayedexpansion
color 0A
cls

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║     THO DM ALL DISCORD - Iniciando Bots Discord           ║
echo ║        Bot Discord Multi-Instancia (Admin + Workers)      ║
echo ║                                                             ║
echo ║     Los bots se mantendrán ACTIVOS en esta ventana       ║
echo ║     ¡NO CIERRES ESTA VENTANA!                             ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Cambiar a la carpeta del script
cd /d "%~dp0"

REM Verificar que estamos en la carpeta correcta
if not exist "assest\node.js" (
    color 0C
    echo [ERROR] No se encontró el archivo assest\node.js
    echo Asegúrate de estar en la carpeta correcta
    echo.
    pause
    exit /b 1
)

REM Verificar que tokens.txt existe
if not exist "tokens.txt" (
    color 0C
    echo [ERROR] No se encontró el archivo tokens.txt
    echo Crea el archivo tokens.txt con tus tokens de bots
    echo.
    pause
    exit /b 1
)

REM Verificar que Node.js está instalado
node --version >nul 2>&1
if errorlevel 1 (
    color 0C
    echo [ERROR] Node.js no está instalado o no está en el PATH
    echo Descarga Node.js desde: https://nodejs.org/
    echo.
    pause
    exit /b 1
)

echo [✓] Verificaciones completadas
echo.
echo [*] Iniciando bots...
echo [*] Esperando conexión...
echo.
timeout /t 2 /nobreak

REM Ejecutar el script principal (los bots se mantendrán activos)
REM El script solo se detiene si hay un error crítico
node assest/node.js

REM Si llegamos aquí, el script se terminó (probablemente por error)
echo.
color 0C
echo ╔════════════════════════════════════════════════════════════╗
echo ║                [!] ADVERTENCIA                             ║
echo ║                                                             ║
echo ║  El script se ha detenido inesperadamente                 ║
echo ║                                                             ║
echo ║  Posibles causas:                                          ║
echo ║  1. Tokens inválidos o revocados                          ║
echo ║  2. Conexión a internet interrumpida                      ║
echo ║  3. Error en Discord API                                  ║
echo ║  4. Tokens.txt está vacío o mal configurado              ║
echo ║                                                             ║
echo ║  Soluciones:                                               ║
echo ║  1. Verifica que los tokens sean válidos                  ║
echo ║  2. Regenera tokens en Discord Developer Portal           ║
echo ║  3. Recarga el script                                      ║
echo ║                                                             ║
echo ║  Para más información, lee CONFIGURAR_ADMIN.md            ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo Presiona cualquier tecla para cerrar...
pause
exit /b 1
