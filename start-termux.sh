#!/bin/bash

clear
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║        THO DM ALL DISCORD - Iniciando Bots en Termux       ║"
echo "║                Bot Discord Multi-Instancia                 ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

cd "$(dirname "$0")" || exit 1

if [ ! -f "assest/node.js" ]; then
    echo "[ERROR] No se encontró el archivo assest/node.js"
    echo ""
    echo "Asegúrate de estar en la carpeta correcta y que el archivo existe"
    exit 1
fi

if [ ! -f "tokens.txt" ]; then
    echo "[ERROR] No se encontró el archivo tokens.txt"
    echo ""
    echo "Crea el archivo tokens.txt con tus tokens de bots (uno por línea)"
    exit 1
fi

echo "[*] Iniciando bots en Termux..."
echo ""
echo "[INFO] Mantén Termux abierto o usa background (nohup)"
echo ""

node assest/node.js

echo ""
echo "[!] El script ha terminado."
echo ""
echo "[CONSEJO] Para ejecutar en background sin cerrar Termux:"
echo "   exit  (primero sal de este script)"
echo "   nohup node assest/node.js > output.log 2>&1 &"
echo "   tail -f output.log  (para ver logs en tiempo real)"
echo ""
