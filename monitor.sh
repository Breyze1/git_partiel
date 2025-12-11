#!/bin/bash
# Script de surveillance système
# Auteur: Ewan GOOD
# Version: 1.0

function show_ram() {
    echo "[RAM] Utilisation :"
    # on définit total_mem mais on appelle total_memory
    total_mem=$(free -h | grep Mem | awk '{print $2}')
    used_mem=$(free -h | grep Mem | awk '{print $3}')
    echo "Utilisé : $used_mem / $total_memory"
}

function main() {
    echo "=== Démarrage du Monitoring ==="
    show_ram
    echo "==============================="
}

main
