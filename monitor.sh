#!/bin/bash
# Script de surveillance système
# Auteur: Ewan GOOD
# Version: 1.0

function show_cpu() {
    echo "[CPU] Utilisation :"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
}


function main() {
    echo "=== Démarrage du Monitoring ==="
    # Les fonctions seront appelées ici
    show_cpu
    echo "==============================="
}


main
