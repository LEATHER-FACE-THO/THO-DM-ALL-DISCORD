#!/bin/bash

clear
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║      THO DM ALL DISCORD - Instalador para Linux/Kali       ║"
echo "║               Bot Discord Multi-Instancia                  ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
    if command -v apt &> /dev/null; then
        PACKAGE_MANAGER="apt"
    elif command -v pacman &> /dev/null; then
        PACKAGE_MANAGER="pacman"
    elif command -v yum &> /dev/null; then
        PACKAGE_MANAGER="yum"
    else
        PACKAGE_MANAGER="unknown"
    fi
else
    echo "[ERROR] Este script solo funciona en Linux"
    exit 1
fi

echo "[*] Sistema detectado: Linux ($PACKAGE_MANAGER)"
echo ""

if ! command -v node &> /dev/null; then
    echo "[!] Node.js no detectado. Instalando..."
    echo ""
    
    if [ "$PACKAGE_MANAGER" = "apt" ]; then
        echo "[*] Actualizando lista de paquetes..."
        sudo apt update
        echo "[*] Instalando Node.js LTS..."
        sudo apt install -y nodejs npm
    elif [ "$PACKAGE_MANAGER" = "pacman" ]; then
        echo "[*] Instalando Node.js..."
        sudo pacman -S nodejs npm
    elif [ "$PACKAGE_MANAGER" = "yum" ]; then
        echo "[*] Instalando Node.js..."
        sudo yum install -y nodejs npm
    else
        echo "[ERROR] No se pudo determinar el gestor de paquetes"
        echo "Por favor, instala Node.js manualmente"
        exit 1
    fi
else
    echo "[OK] Node.js detectado:"
    node --version
fi

echo ""

if ! command -v npm &> /dev/null; then
    echo "[ERROR] npm no está disponible"
    exit 1
fi

echo "[OK] npm detectado:"
npm --version
echo ""

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
echo "   o"
echo "   vim assest/node.js"
echo ""
echo "   Busca la línea: const ADMIN_BOT_TOKEN = 'EL_TOKEN_DEL_BOT_ADMIN_AQUI';"
echo "   Reemplázala con tu token de bot admin"
echo ""
echo "2. Edita el archivo: tokens.txt"
echo "   nano tokens.txt"
echo "   Agrega los tokens de tus bots trabajadores (uno por línea)"
echo ""
echo "3. Ejecuta el script:"
echo "   ./start.sh"
echo "   o"
echo "   npm start"
echo ""
echo "[VERIFICACIÓN]"
echo "Token válido debe tener formato: MTQxNDAx...resto_del_token"
echo ""

read -p "Presiona Enter para salir..."
