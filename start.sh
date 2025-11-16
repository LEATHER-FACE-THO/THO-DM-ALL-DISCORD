#!/bin/bash

clear
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║         THO DM ALL DISCORD - Iniciando Bots Discord              ║"
echo "║      Bot Discord Multi-Instancia (Admin + Workers)       ║"
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

echo "[*] Iniciando bots..."
echo ""

node assest/node.js

echo ""
echo "[!] El script ha terminado."
