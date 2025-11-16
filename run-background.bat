@echo off
REM Script para iniciar los bots en Segundo Plano
REM THO DM ALL DISCORD - Ejecución en Background

setlocal enabledelayedexpansion
color 0B
cls

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║    THO DM ALL DISCORD - Iniciador en Background           ║
echo ║     Los bots continuarán activos aunque cierres esta      ║
echo ║     ventana (continuará en segundo plano)                 ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Cambiar a la carpeta del script
cd /d "%~dp0"

REM Verificaciones básicas
if not exist "assest\node.js" (
    color 0C
    echo [ERROR] No se encontró assest\node.js
    pause
    exit /b 1
)

if not exist "tokens.txt" (
    color 0C
    echo [ERROR] No se encontró tokens.txt
    pause
    exit /b 1
)

node --version >nul 2>&1
if errorlevel 1 (
    color 0C
    echo [ERROR] Node.js no está instalado
    pause
    exit /b 1
)

echo [✓] Iniciando bots en segundo plano...
echo.

REM Crear archivo de log
set "logfile=%~dp0bots.log"
echo [%date% %time%] Iniciando THO DM ALL DISCORD >> "%logfile%"

REM Iniciar Node.js en segundo plano (sin cerrar esta ventana)
REM Usar start /b para ejecutar sin nueva ventana
start "" /b node assest/node.js >> "%logfile%" 2>&1

REM Verificar que el proceso se inició
timeout /t 2 /nobreak

tasklist | find "node.exe" >nul
if errorlevel 1 (
    color 0C
    echo [ERROR] No se pudo iniciar el proceso
    echo Ver log en: %logfile%
    pause
    exit /b 1
)

color 0A
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║           ✅ ¡BOTS INICIADOS CORRECTAMENTE!               ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo [✓] Los bots están activos en segundo plano
echo [✓] Puedes cerrar esta ventana con seguridad
echo.
echo [INFO] Para ver los logs:
echo   Abre: %logfile%
echo.
echo [INFO] Para detener los bots:
echo   Abre Task Manager (Ctrl+Shift+Esc)
echo   Busca: node.exe
echo   Click derecho ^> Finalizar tarea
echo.
echo Presiona una tecla para cerrar esta ventana...
pause
exit /b 0
