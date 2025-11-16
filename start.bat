@echo off
REM Script de Ejecución para Windows
REM THO DM ALL DISCORD - Bot Discord Multi-Instancia

color 0A
cls
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║          THO DM ALL DISCORD - Iniciando Bots Discord              ║
echo ║        Bot Discord Multi-Instancia (Admin + Workers)      ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Verificar que estamos en la carpeta correcta
if not exist "assest\node.js" (
    color 0C
    echo [ERROR] No se encontró el archivo assest\node.js
    echo.
    echo Asegúrate de estar en la carpeta correcta y que el archivo existe
    pause
    exit /b 1
)

REM Verificar que tokens.txt existe
if not exist "tokens.txt" (
    color 0C
    echo [ERROR] No se encontró el archivo tokens.txt
    echo.
    echo Crea el archivo tokens.txt con tus tokens de bots (uno por línea)
    pause
    exit /b 1
)

echo [*] Iniciando bots...
echo.

REM Ejecutar el script principal (mantener la ventana abierta mientras funciona)
cd /d "%~dp0"
node assest/node.js

REM Si el script termina por error, mantener la ventana abierta
echo.
color 0C
echo [!] El script ha terminado. Presiona cualquier tecla para cerrar...
pause
