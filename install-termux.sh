#!/bin/bash

clear
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║        THO DM ALL DISCORD - Instalador para Termux         ║"
echo "║              Bot Discord Multi-Instancia                   ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

if [ ! -d "$PREFIX" ]; then
    echo "[ERROR] Este script solo funciona en Termux"
    echo "Descarga Termux desde: https://f-droid.org/app/com.termux"
    exit 1
fi

echo "[*] Detectado: Termux en Android"
echo ""

echo "[*] Actualizando Termux..."
apt update
apt upgrade -y

echo ""
echo "[*] Instalando Node.js LTS..."
apt install -y nodejs-lts

if [ $? -ne 0 ]; then
    echo "[ERROR] Error al instalar Node.js"
    exit 1
fi

echo ""
echo "[OK] Node.js instalado:"
node --version
echo ""

echo "[OK] npm disponible:"
npm --version
echo ""

echo "[*] Instalando utilidades recomendadas..."
apt install -y git nano wget curl

echo ""

if [ ! -d "$HOME/projects" ]; then
    mkdir -p "$HOME/projects"
    echo "[*] Carpeta de proyectos creada: $HOME/projects"
fi

cd "$(dirname "$0")" || exit 1

echo "[*] Instalando dependencias con npm..."
echo ""
npm install

if [ $? -ne 0 ]; then
    echo ""
    echo "[ERROR] Error durante la instalación de dependencias"
    exit 1
fi

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║        ✅ Instalación Completada Exitosamente            ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "[PASOS SIGUIENTES]"
echo ""
echo "1. Edita el archivo: assest/node.js"
echo "   nano assest/node.js"
echo ""
echo "   Busca: const ADMIN_BOT_TOKEN = 'EL_TOKEN_DEL_BOT_ADMIN_AQUI';"
echo "   Reemplázala con tu token de bot admin"
echo ""
echo "2. Edita el archivo: tokens.txt"
echo "   nano tokens.txt"
echo "   Agrega tokens de bots trabajadores (uno por línea)"
echo ""
echo "3. Ejecuta el script:"
echo "   bash start-termux.sh"
echo "   o"
echo "   npm start"
echo ""
echo "[EJECUCIÓN EN BACKGROUND]"
echo ""
echo "Para ejecutar en background sin que se cierre con Termux:"
echo "   nohup node assest/node.js > output.log 2>&1 &"
echo ""
echo "Para ver logs:"
echo "   tail -f output.log"
echo ""
echo "[IMPORTANTE]"
echo "- Asegúrate de tener conexión a internet estable"
echo "- No cierres Termux mientras está activo (o usa background)"
echo "- El almacenamiento de Termux debe tener al menos 200MB libres"
echo ""

read -p "Presiona Enter para salir..."
